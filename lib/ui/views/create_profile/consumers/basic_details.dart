import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/ui/utils/ui_helpers.dart';
import 'package:svuce_app/ui/views/create_profile/create_profile_viewmodel.dart';
import 'package:svuce_app/ui/widgets/input_field.dart';
import 'package:svuce_app/utils/validators.dart';

class BasicDetails extends ViewModelWidget<CreateProfileViewModel> {
  final UIHelpers uiHelpers;

  BasicDetails(this.uiHelpers);

  @override
  Widget build(BuildContext context, CreateProfileViewModel model) {
    return Form(
      key: model.basicDetailsFormKey,
      child: ListView(
        children: <Widget>[
          Text.rich(TextSpan(children: [
            TextSpan(
                text: "Your Basic Details\n",
                style: uiHelpers.title.copyWith(color: textPrimaryColor)),
            TextSpan(
                text: "Drop your basic details here\n\n",
                style: uiHelpers.body.copyWith(color: textSecondaryColor)),
          ])),
          InputField(
            iconData: personIcon,
            title: "Your Full Name",
            keyboardType: TextInputType.text,
            controller: model.fullNameController,
            validator: validateName,
          ),
          InputField(
            iconData: idIcon,
            title: "Your Roll No.",
            maxLength: 8,
            validator: validateRollNo,
            keyboardType: TextInputType.number,
            controller: model.rollNoController,
          ),
          Container(
            decoration: BoxDecoration(
                color: surfaceColor, borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: Icon(
                schoolIcon,
                color: primaryColor,
              ),
              title: Text(
                "SVUCE",
                style: uiHelpers.body.copyWith(color: textSecondaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
