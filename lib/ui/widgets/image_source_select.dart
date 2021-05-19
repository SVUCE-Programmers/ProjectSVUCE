import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/icons.dart';

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
    return Container(
        width: MediaQuery.of(context).size.width,
        color: surfaceColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextButton.icon(
                icon: Icon(
                  galleryIcon,
                  color: primaryColor,
                ),
                onPressed: selectFromGallery,
                label: Text(
                  "\t Gallery",
                  style: TextStyle(color: textPrimaryColor),
                )),
            TextButton.icon(
                icon: Icon(
                  cameraIcon,
                  color: primaryColor,
                ),
                onPressed: selectFromCamera,
                label: Text(
                  "\t Camera",
                  style: TextStyle(color: textPrimaryColor),
                )),
            TextButton.icon(
                icon: Icon(
                  deleteIcon,
                  color: primaryColor,
                ),
                onPressed: continueWithNoImage,
                label: Text(
                  "\t Remove Photo",
                  style: TextStyle(color: textPrimaryColor),
                )),
          ],
        ));
  }
}
