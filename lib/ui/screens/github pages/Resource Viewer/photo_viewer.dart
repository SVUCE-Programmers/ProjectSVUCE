import 'package:flutter/material.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';

class ImageViewerWidget extends StatelessWidget {
  final String url;
  final String title;
  final Function onBack;
  const ImageViewerWidget({Key key, this.url, this.title, this.onBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiHelpers uiHelpers = UiHelpers.fromContext(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: onBack,
            icon: Icon(
              backIcon,
              color: uiHelpers.textPrimaryColor,
            )),
        title: Text("$title", style: uiHelpers.headline),
      ),
      body: InteractiveViewer(
        panEnabled: false, // Set it to false to prevent panning.
        boundaryMargin: EdgeInsets.all(20),
        minScale: 0.5,
        maxScale: 4,
        child: FadeInImage(
            placeholder: AssetImage("assets/images/logo.png"),
            image: NetworkImage(url)),
      ),
    );
  }
}
