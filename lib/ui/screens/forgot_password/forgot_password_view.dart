import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/ui/widgets/button.dart';
import 'package:svuce_app/ui/widgets/input_field.dart';

import 'forgot_password_viewmodel.dart';

class ForgotPasswordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<ForgotPasswordViewModel>(
      viewModel: ForgotPasswordViewModel(),
      builder: (context, uiHelpers, model) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
                icon: Icon(
                  backIcon,
                  color: textPrimaryColor,
                ),
                onPressed: model.goBack),
            title: Text(
              "Forgot Password",
              style: uiHelpers.headline.copyWith(color: Colors.white),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
          ),
          body: Form(
            key: model.formKey,
            child: ListView(
              padding: EdgeInsets.all(20.0),
              children: <Widget>[
                Text(
                  "Enter your registered email and we\'ll send you the mail to reset your password\n",
                  style: uiHelpers.body.copyWith(color: textSecondaryColor),
                ),
                InputField(
                  title: "Enter your email..",
                  iconData: emailIcon,
                  validator: model.validateEmail,
                  controller: model.emailTextEditingController,
                  keyboardType: TextInputType.emailAddress,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Button(
                    isBusy: model.isBusy,
                    onPressed: model.resetPassword,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
