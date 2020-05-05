import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/ui/utils/ui_helpers.dart';

class SelectProfileImage extends StatelessWidget {
  final ImageProvider image;
  final Function chooseImage;

  const SelectProfileImage({Key key, this.image, this.chooseImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UIHelpers uiHelpers = UIHelpers.fromContext(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text.rich(TextSpan(children: [
          TextSpan(
              text: "Your Profile Image\n",
              style: uiHelpers.title.copyWith(color: textPrimaryColor)),
          TextSpan(
              text: "Snap a quick selfie or upload existing",
              style: uiHelpers.body.copyWith(color: textSecondaryColor)),
        ])),
        uiHelpers.verticalSpaceHigh,
        Container(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: chooseImage,
            child: CircleAvatar(
              radius: uiHelpers.blockSizeHorizontal * 20,
              backgroundImage: image != null ? image : null,
            ),
          ),
        ),
      ],
    );
  }
}
