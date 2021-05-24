import 'package:flutter/material.dart';
import 'package:svuce_app/ui/widgets/pdf%20viewer/viewer.dart';

import 'pdf viewer/document.dart';

class PdfViewer extends StatefulWidget {
  @override
  _PdfViewerState createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
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
          ? CircularProgressIndicator()
          : PDFViewer(
              maxScale: 10,
              minScale: 1,
              scrollDirection: Axis.vertical,
              document: document,
            ),
    );
  }

  loadDocument() async {
    document = await PDFDocument.fromURL(
      "https://svuce.edu.in/cseFiles/Profile-MHK-21-7-2018.pdf",
    );
    setState(() {
      _isLoading = false;
    });
  }
}
