import 'package:flutter/material.dart';
import 'package:svuce_app/ui/widgets/pdf%20viewer/viewer.dart';

import 'pdf viewer/document.dart';

class PdfViewerWidget extends StatefulWidget {
  final String url;

  const PdfViewerWidget({Key key, @required this.url}) : super(key: key);
  @override
  _PdfViewerWidgetState createState() => _PdfViewerWidgetState();
}

class _PdfViewerWidgetState extends State<PdfViewerWidget> {
  bool _isLoading = true;
  PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Scaffold(
              body: Center(child: CircularProgressIndicator()),
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
            )
          : PDFViewer(
              maxScale: 100,
              minScale: 1,
              scrollDirection: Axis.vertical,
              document: document,
            ),
    );
  }

  loadDocument() async {
    try {
      document = await PDFDocument.fromURL(
        Uri.parse(widget.url).toString(),
      );
    } catch (e) {
      //?TODO show error
    }

    setState(() {
      _isLoading = false;
    });
  }
}
