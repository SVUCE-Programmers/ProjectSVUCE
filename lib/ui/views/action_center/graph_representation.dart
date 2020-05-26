import 'package:flutter/material.dart';
import 'package:svuce_app/models/graph.dart';
import 'package:svuce_app/ui/widgets/graph_widget.dart';

class GraphRepresentation extends StatefulWidget {
  final Graph graph;
  final List<String> subject;
  const GraphRepresentation({Key key, this.graph, this.subject})
      : super(key: key);
  @override
  _GraphRepresentationState createState() => _GraphRepresentationState();
}

class _GraphRepresentationState extends State<GraphRepresentation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  @override
  void initState() {
    widget.graph.addListener(() {
      setState(() {});
    });
    _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 2000),
        upperBound: widget.graph.maxDomain);
    _controller.addListener(() {
      final d = _controller.value - widget.graph.domainStart;
      if (d < 0) {
        widget.graph.domainStart += d;
        widget.graph.domainEnd += d;
      } else {
        widget.graph.domainEnd += d;
        widget.graph.domainStart += d;
      }
    });
    super.initState();
  }
  @override
  void dispose() { 
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: GraphWidget(
          graph: widget.graph,
          subjects: widget.subject,
        ),
      ),
    );
  }
}
