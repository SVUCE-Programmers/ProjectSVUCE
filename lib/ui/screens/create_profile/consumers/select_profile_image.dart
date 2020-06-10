import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';
import 'package:svuce_app/ui/screens/create_profile/create_profile_viewmodel.dart';

class SelectProfileImage extends ViewModelWidget<CreateProfileViewModel> {
  final UIHelpers uiHelpers;

  SelectProfileImage(this.uiHelpers);

  @override
  Widget build(BuildContext context, CreateProfileViewModel model) {
    return ListView(
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
            onTap: () => model.chooseImage(),
            child: CircleAvatar(
              radius: uiHelpers.blockSizeHorizontal * 20,
              backgroundImage: model.profileImage == null
                  ? null
                  : FileImage(model.profileImage),
            ),
          ),
        ),
      ],
    );
  }
}
