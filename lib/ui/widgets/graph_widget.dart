import 'package:flutter/material.dart';
import 'package:svuce_app/app/configs.dart';
import 'dart:ui' as ui;

import 'package:svuce_app/core/models/graph.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';

class GraphWidget extends StatefulWidget {
  final Graph graph;
  final List<String> subjects;
  final List<String> yAxis;

  const GraphWidget({Key key, this.graph, this.subjects, this.yAxis})
      : super(key: key);
  @override
  _GraphWidgetState createState() => _GraphWidgetState();
}

class _GraphWidgetState extends State<GraphWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  double _startRange;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    _controller.addListener(() {
      setState(() {});
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
    UiHelpers uiHelpers = UiHelpers.fromContext(context);
    final List<String> yAxisLabels = widget.yAxis;
    String label0Text;
    double label0Y;
    if (widget.graph.selectedDataPoint != -1) {
      label0Text = numberToPriceString(
          (widget.graph.dataSets[0].values[widget.graph.selectedDataPoint] *
              100));
      label0Y = (150) *
              (MediaQuery.of(context).size.height / 480) *
              (1.0 - widget.graph.selectedY(0)) +
          10;
    }

    final appSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTapUp: (details) => _handleTap(appSize, details),
      onHorizontalDragStart: (_) => _handleStartInteract(context),
      onHorizontalDragUpdate: _handleDrag,
      onHorizontalDragEnd: (_) => _handleEndInteract(context),
      onScaleStart: (details) {
        _handleStartInteract(context);
        _handleStartZoom(details);
      },
      onScaleUpdate: _handleZoom,
      onScaleEnd: (_) => _handleEndInteract(context),
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: (MediaQuery.of(context).size.height / 48) * 15,
              child: CustomPaint(
                foregroundPainter: ForegroundPainter(
                    widget.graph, _controller, [
                  Color(0x4C4AC3E5),
                  Color(0x005290C7),
                  Color(0x4CDEACD0),
                  Color(0x00DEACD0)
                ], [
                  Color(0xFF4A78ED),
                  Color(0xFF5DB391),
                  Color(0xFFA74CBA),
                  Color(0xFFF287A6)
                ]),
                painter: GraphPainter(
                    widget.graph, widget.subjects, appSize, uiHelpers),
              ),
            ),
            Positioned(
              left: 4,
              height: (150) * (appSize.height / 480),
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: yAxisLabels
                      .map((label) => Text(label,
                          style: TextStyle(
                            color: Color(0xFFC4C8D9),
                            fontSize: 12,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w200,
                          )))
                      .toList(),
                ),
              ),
            ),
            Positioned(
              left: appSize.width - 45,
              height: (150) * (appSize.height / 480),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: yAxisLabels
                    .map((label) => Text(label,
                        style: TextStyle(
                          color: Color(0xFFC4C8D9),
                          fontSize: 12,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w200,
                        )))
                    .toList(),
              ),
            ),
            if (widget.graph.selectedDataPoint != -1) ...{
              _buildLabel(
                  appSize,
                  label0Text,
                  TextStyle(
                    color: Color(0xFFDCE2F5),
                    fontFamily: 'Quicksand',
                    fontSize: 10,
                  ),
                  label0Y,
                  uiHelpers),
            },
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(Size appSize, String text, TextStyle style, double y,
      UiHelpers uiHelpers) {
    return Positioned(
      left: appSize.width * widget.graph.selectedX() + 8,
      top: 10,
      width: 40,
      child: Container(
        color: Color(0x99252B40)
            .withOpacity(_controller.value < 0.6 ? _controller.value : 0.6),
        padding: EdgeInsets.all(4),
        child: Text(text,
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: uiHelpers.textSecondaryColor
                    .withOpacity(_controller.value))),
      ),
    );
  }

  void _handleTap(Size appSize, TapUpDetails details) {
    final x = (details.localPosition.dx - 28) / appSize.width;
    final offset = lerp(widget.graph.domainStart, widget.graph.domainEnd, x);
    if (offset.round() != widget.graph.selectedDataPoint) {
      widget.graph.selectedDataPoint = offset.round();
      _controller.forward(from: 0.0);
    }
  }

  void _handleStartInteract(BuildContext context) {
    InteractNotification(false)..dispatch(context);
  }

  void _handleEndInteract(BuildContext context) {
    InteractNotification(true)..dispatch(context);
  }

  void _handleStartZoom(ScaleStartDetails details) {
    _startRange = widget.graph.domainEnd - widget.graph.domainStart;
  }

  void _handleZoom(ScaleUpdateDetails details) {
    double d = 1.0 / details.scale;
    if (d == 0) return;
    final targetRange = _startRange * d;
    final range = widget.graph.domainEnd - widget.graph.domainStart;
    final scale = targetRange - range;

    if (range + scale < 13.0) {
      if (widget.graph.domainEnd != widget.graph.maxDomain) {
        widget.graph.domainEnd += scale;
      } else {
        widget.graph.domainStart -= scale;
      }
    }

    _controller.reverse();
  }

  void _handleDrag(DragUpdateDetails details) {
    final d = -details.primaryDelta /
        150 *
        (widget.graph.domainEnd - widget.graph.domainStart);
    if (widget.graph.domainStart + d < 0 ||
        widget.graph.domainEnd + d >= widget.graph.maxDomain) return;
    if (d < 0) {
      widget.graph.domainStart += d;
      widget.graph.domainEnd += d;
    } else {
      widget.graph.domainEnd += d;
      widget.graph.domainStart += d;
    }
    _controller.reverse();
  }
}

class ForegroundPainter extends CustomPainter {
  Graph _graph;
  Animation<double> _selectedFade;
  List<Color> _backgroundColors;
  List<Color> _foregroundColors;
  ForegroundPainter(Graph graph, Animation<double> selectedFade,
      List<Color> backgroundColors, List<Color> foregroundColors)
      : _graph = graph,
        _selectedFade = selectedFade,
        _backgroundColors = backgroundColors,
        _foregroundColors = foregroundColors,
        super(repaint: Listenable.merge([graph, selectedFade]));
  double dataY(List<double> values, int index) {
    final y = ((values[index] - _graph.rangeStart) / _graph.rangeEnd) * 10;
    return y;
  }

  void paintChartData(
      Graph graph,
      int dataSetIndex,
      List<Color> backgroundColors,
      List<Color> foregroundColors,
      ui.Canvas canvas,
      Size size) {
    final range = graph.domainEnd - graph.domainStart;

    final dataOffset = (int index) {
      final x =
          ((index.toDouble() - graph.domainStart) / range) * size.width + 28;
      final y = dataY(graph.dataSets[dataSetIndex].values, index) * size.height;
      return Offset(x, y + 20);
    };

    final path = Path();
    final start = graph.domainStart;
    final end = graph.domainEnd;

    Offset offset0;
    if (start.floor() > 0) {
      offset0 = dataOffset(start.floor() - 1);
      path.moveTo(offset0.dx, offset0.dy);
    } else {
      offset0 = dataOffset(0);
      path.moveTo(0, offset0.dy);
    }

    for (int i = start.floor(); i < end.ceil(); ++i) {
      var offset1 = dataOffset(i);
      path.cubicTo(
          lerp(offset0.dx, offset1.dx, 0.5),
          offset0.dy,
          lerp(offset0.dx, offset1.dx, 0.5),
          offset1.dy,
          offset1.dx,
          offset1.dy);
      offset0 = offset1;
    }

    if (end.ceil() < graph.maxDomain.floor()) {
      var offset1 = dataOffset(end.ceil());
      path.cubicTo(
          lerp(offset0.dx, offset1.dx, 0.5),
          offset0.dy,
          lerp(offset0.dx, offset1.dx, 0.5),
          offset1.dy,
          offset1.dx,
          offset1.dy);
      offset0 = offset1;
    } else {
      var offset1 = dataOffset(end.ceil() - 1);
      path.lineTo(size.width, offset1.dy);
      offset0 = offset1;
    }

    canvas.drawPath(
        path,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 4
          ..shader = ui.Gradient.linear(
            Offset(0, 0),
            Offset(size.width, 0),
            foregroundColors,
          ));

    path.lineTo(size.width, 0);
    path.lineTo(00, 0);
    offset0 = dataOffset(0);
    path.lineTo(0, offset0.dy);

    canvas.drawPath(
        path,
        Paint()
          ..style = PaintingStyle.fill
          ..shader = ui.Gradient.linear(
            Offset(0, size.height),
            Offset(0, 0),
            backgroundColors,
            [
              0.5,
              1.0,
            ],
          ));
  }

  @override
  void paint(canvas, size) {
    canvas.translate(0.0, size.height);
    canvas.scale(1.0, -1.0);

    for (int i = 0; i < _graph.dataSets.length; ++i) {
      paintChartData(_graph, i, _backgroundColors.sublist(i * 2, i * 2 + 2),
          _foregroundColors.sublist(i * 2, i * 2 + 2), canvas, size);
    }

    if (_graph.selectedDataPoint != -1) {
      double maxY = 0;
      for (var dataSet in _graph.dataSets) {
        final y = dataY(dataSet.values, _graph.selectedDataPoint);
        if (y > maxY) maxY = y;
      }
      final range = _graph.domainEnd - _graph.domainStart;
      final x =
          ((_graph.selectedDataPoint.toDouble() - _graph.domainStart) / range) *
                  size.width +
              28;
      canvas.drawLine(Offset(x, 0), Offset(x, maxY * size.height),
          Paint()..color = Colors.white.withOpacity(_selectedFade.value));

      for (var dataSet in _graph.dataSets) {
        final y = dataY(dataSet.values, _graph.selectedDataPoint);

        final offset = Offset(x, y * size.height + 20);

        canvas.drawCircle(
            offset,
            12.0,
            Paint()
              ..blendMode = BlendMode.plus
              ..shader = ui.Gradient.radial(
                offset,
                12.0,
                [
                  Colors.white.withOpacity(_selectedFade.value),
                  Colors.transparent
                ],
              ));
        canvas.drawCircle(offset, 4.8,
            Paint()..color = Colors.white.withOpacity(_selectedFade.value));
      }
    }
  }

  @override
  bool shouldRepaint(ForegroundPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(ForegroundPainter oldDelegate) => false;
}

class GraphPainter extends CustomPainter {
  Graph _graph;
  List<String> labels;
  Size size;

  UiHelpers uiHelpers;
  GraphPainter(
      Graph graph, List<String> subjects, Size size, UiHelpers uiHelpers)
      : _graph = graph,
        labels = subjects,
        uiHelpers = uiHelpers,
        size = size,
        super(repaint: graph);
  @override
  void paint(Canvas canvas, Size size) {
    final List<String> xAxisLabels = [];
    for (int i = _graph.domainStart.round();
        i <= _graph.domainEnd.round();
        ++i) {
      xAxisLabels.add(labels[i % (labels.length == 0 ? 1 : labels.length)]);
    }
    final double start = _graph.domainStart;
    final double end = _graph.domainEnd;
    for (int i = start.round(); i <= end.round(); ++i) {
      final x =
          (i.toDouble() - start.round()) / (end - start) * size.width + 28;
      canvas.drawLine(
          Offset(x + 0.5, 0),
          Offset(x, size.height - 20),
          Paint()
            ..color = Color(0xFF3D4666)
            ..strokeWidth = 1.0);
    }
    for (int i = start.round(); i <= end.round(); ++i) {
      final x = (i.toDouble() - start) / (end - start) * size.width + 28;
      final textPainter = TextPainter(
        text: TextSpan(
          text: xAxisLabels[i - start.round()],
          style: TextStyle(
            color: i == _graph.selectedDataPoint
                ? uiHelpers.primaryColor
                : Colors.blue,
            fontFamily: Configs.titleFont,
            fontWeight: i == _graph.selectedDataPoint
                ? FontWeight.bold
                : FontWeight.w200,
            fontSize: 12,
          ),
        ),
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
      )..layout(
          minWidth: 0,
          maxWidth: size.width,
        );
      textPainter.paint(canvas, Offset(x - 10, size.height - 20));
    }
  }

  @override
  bool shouldRepaint(GraphPainter oldPainter) {
    return false;
  }
}

@override
bool shouldRebuildSemantics(GraphPainter oldDelegate) => false;

double lerp(double x, double y, double s) {
  return x * (1 - s) + y * s;
}

String numberToPriceString(num value) {
  return value.toString().replaceAllMapped(
      new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
}

class InteractNotification extends Notification {
  final bool end;

  InteractNotification(this.end);
}
