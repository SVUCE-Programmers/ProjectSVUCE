import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';

class ImageSourceSelect extends StatelessWidget {
  final Function selectFromGallery;
  final Function selectFromCamera;

  const ImageSourceSelect(
      {Key key, this.selectFromGallery, this.selectFromCamera})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        color: surfaceColor,
        child: Column(
          children: <Widget>[
            FlatButton(
                onPressed: selectFromGallery,
                child: Text(
                  "Gallery",
                  style: TextStyle(color: textPrimaryColor),
                )),
            FlatButton(
                onPressed: selectFromCamera,
                child: Text(
                  "Camera",
                  style: TextStyle(color: textPrimaryColor),
                )),
          ],
        ));
  }
}
