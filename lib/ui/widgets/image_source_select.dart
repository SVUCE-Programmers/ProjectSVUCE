import 'package:flutter/material.dart';

import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';

class ImageSourceSelect extends StatelessWidget {
  final Function selectFromGallery;
  final Function selectFromCamera;
  final Function continueWithNoImage;

  const ImageSourceSelect(
      {Key key,
      this.selectFromGallery,
      this.selectFromCamera,
      this.continueWithNoImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UiHelpers uiHelpers = UiHelpers.fromContext(context);
    return Container(
        width: MediaQuery.of(context).size.width,
        color: uiHelpers.surfaceColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextButton.icon(
                icon: Icon(
                  galleryIcon,
                  color: uiHelpers.primaryColor,
                ),
                onPressed: selectFromGallery,
                label: Text(
                  "\t Gallery",
                  style: TextStyle(color: uiHelpers.textPrimaryColor),
                )),
            TextButton.icon(
                icon: Icon(
                  cameraIcon,
                  color: uiHelpers.primaryColor,
                ),
                onPressed: selectFromCamera,
                label: Text(
                  "\t Camera",
                  style: TextStyle(color: uiHelpers.textPrimaryColor),
                )),
            TextButton.icon(
                icon: Icon(
                  deleteIcon,
                  color: uiHelpers.primaryColor,
                ),
                onPressed: continueWithNoImage,
                label: Text(
                  "\t Remove Photo",
                  style: TextStyle(color: uiHelpers.textPrimaryColor),
                )),
          ],
        ));
  }
}
