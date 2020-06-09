import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';
import 'package:svuce_app/ui/screens/create_profile/create_profile_viewmodel.dart';
import 'package:svuce_app/ui/widgets/input_field.dart';

class ContactDetails extends ViewModelWidget<CreateProfileViewModel> {
  final UIHelpers uiHelpers;

  ContactDetails(this.uiHelpers);

  @override
  Widget build(BuildContext context, CreateProfileViewModel model) {
    return Form(
      key: model.contactDetailsFormKey,
      child: ListView(
        children: <Widget>[
          Text.rich(TextSpan(children: [
            TextSpan(
                text: "Your Contact Info\n",
                style: uiHelpers.title.copyWith(color: textPrimaryColor)),
            TextSpan(
                text: "Enter your details to let others see your info.\n\n",
                style: uiHelpers.body.copyWith(color: textSecondaryColor)),
          ])),
          InputField(
            iconData: messageIcon,
            title: "Your Contact",
            keyboardType: TextInputType.number,
            maxLength: 10,
            controller: model.contactController,
            validator: model.validatePhoneNo,
          ),
          InputField(
            iconData: bulbIcon,
            title: "Bio",
            keyboardType: TextInputType.text,
            maxLength: 150,
            maxLines: 4,
            controller: model.bioController,
          ),
        ],
      ),
    );
  }
}
