import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:path_provider/path_provider.dart';

class CreateFileButton extends HookWidget {
  final Widget child;
  final ShapeBorder shapeBorder;
  final Color backgroundColor;
  final String url;
  const CreateFileButton(
      {Key key,
      this.shapeBorder,
      this.backgroundColor,
      this.child,
      this.url =
          "https://docs.google.com/spreadsheets/d/1R8C3UTZ3a5gUxP07ajZ0tMcLRzxRQ3vJXwABvHZxB0U/edit?usp=sharing"})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final progress = useState("0");
    final isDownloading = useState(false);
    return MaterialButton(
      color: backgroundColor ?? Theme.of(context).primaryColor,
      shape: shapeBorder ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
      onPressed: () async {
        var dio = new Dio();
        var dir = await getExternalStorageDirectory();
        var knockDir =
            await new Directory('${dir.path}').create(recursive: true);
        print(url);
        File file = File("${knockDir.path}/Svuce.xlsx");
        print(file.path);
        print(file.parent);
        await dio.download(url, '${knockDir.path}/Svuce.xlsx',
            onReceiveProgress: (rec, total) {
          print("Rec: $rec , Total: $total");
          isDownloading.value = true;
          progress.value = ((rec / total) * 100).toStringAsFixed(0) + "%";
        });

        isDownloading.value = false;
        progress.value = "Completed";
      },
      child: isDownloading.value ? CircularProgressIndicator() : child,
    );
  }
}
