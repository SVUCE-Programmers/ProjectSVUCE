import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/ui/utils/ui_helpers.dart';
import 'package:svuce_app/ui/widgets/button.dart';
import 'package:svuce_app/ui/widgets/input_field.dart';

import 'login_viewmodel.dart.dart';

class LoginPage extends ViewModelWidget<LoginViewModel> {
  final bool isStudent;
  final UIHelpers uiHelpers;

  LoginPage({Key key, this.isStudent, this.uiHelpers});

  @override
  Widget build(BuildContext context, LoginViewModel model) {
    return Form(
      key: isStudent ? model.studentKey : model.teacherKey,
      child: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          Text.rich(TextSpan(children: [
            TextSpan(
              text: "Welcome Back\n",
              style: uiHelpers.headline.copyWith(color: textPrimaryColor),
            ),
            TextSpan(
              text: "Log in to your account to \ncontinue",
              style: uiHelpers.body.copyWith(color: textSecondaryColor),
            )
          ])),
          uiHelpers.verticalSpaceMedium,
          InputField(
            controller: model.emailController,
            title: "Your email here..",
            keyboardType: TextInputType.emailAddress,
            iconData: emailIcon,
            validator: model.validateEmail,
          ),
          InputField(
            controller: model.passwordController,
            title: "Your password here",
            keyboardType: TextInputType.text,
            iconData: passwordIcon,
            isSecure: true,
            validator: model.validatePassword,
          ),
          Row(
            mainAxisAlignment: isStudent
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              isStudent
                  ? FlatButton(
                      padding: EdgeInsets.all(10.0),
                      onPressed: model.gotoSignup,
                      child: Text.rich(TextSpan(children: [
                        TextSpan(
                            text: "If you don\'t have an \naccount,",
                            style: uiHelpers.body
                                .copyWith(color: textSecondaryColor)),
                        TextSpan(
                            text: " Signup",
                            style:
                                uiHelpers.body.copyWith(color: primaryColor)),
                      ])))
                  : SizedBox(),
              Button(
                isBusy: model.isBusy,
                onPressed: () => model.handleLogin(isStudent: isStudent),
              ),
            ],
          )
        ],
      ),
    );
  }
}
