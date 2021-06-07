import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;

import 'package:path_provider/path_provider.dart';

class WidgetToImage {
  Future<File> capturePng(GlobalKey globalKey) async {
    try {
      RenderRepaintBoundary boundary =
          globalKey.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData.buffer.asUint8List();
      // var bs64 = base64Encode(pngBytes);
      var dir = await getExternalStorageDirectory();
      var knockDir = await new Directory('${dir.path}').create(recursive: true);
      File file = File(knockDir.path + "/Screenshots/abc.png");
      File((knockDir.path + "/Screenshots/abc.png"))
        ..createSync(recursive: true)
        ..writeAsBytesSync(pngBytes);
      return file;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
