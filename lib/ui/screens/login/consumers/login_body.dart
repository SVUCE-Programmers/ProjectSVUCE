import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';
import 'package:svuce_app/ui/screens/login/login_viewmodel.dart.dart';
import 'package:svuce_app/ui/widgets/button.dart';
import 'package:svuce_app/ui/widgets/input_field.dart';

class LoginViewBody extends ViewModelWidget<LoginViewModel> {
  final bool isStudent;

  LoginViewBody({this.isStudent = false});

  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {
    final UiHelpers uiHelpers = UiHelpers.fromContext(context);

    return ListView(
      padding: EdgeInsets.all(20.0),
      children: <Widget>[
        Text.rich(TextSpan(children: [
          TextSpan(
            text: "💐 Welcome Back, \n",
            style:
                uiHelpers.headline.copyWith(color: uiHelpers.textPrimaryColor),
          ),
          TextSpan(
            text: "Log in to your account to \ncontinue",
            style: uiHelpers.body.copyWith(color: uiHelpers.textSecondaryColor),
          )
        ])),
        uiHelpers.verticalSpaceMedium,
        InputField(
          autoFocus: false,
          title: "Your email here..",
          keyboardType: TextInputType.emailAddress,
          iconData: emailIcon,
          error: viewModel.emailError,
          validator: viewModel.updateEmail,
        ),
        InputField(
          title: "Your password here",
          keyboardType: TextInputType.text,
          iconData: passwordIcon,
          isSecure: true,
          error: viewModel.passwordError,
          validator: viewModel.updatePassword,
        ),
        Row(
          mainAxisAlignment: isStudent
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            isStudent
                ? TextButton(
                    onPressed: viewModel.gotoSignup,
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "If you don\'t have an \naccount,",
                          style: uiHelpers.body
                              .copyWith(color: uiHelpers.textSecondaryColor)),
                      TextSpan(
                          text: " Signup",
                          style: uiHelpers.body
                              .copyWith(color: uiHelpers.primaryColor)),
                    ])))
                : SizedBox(),
            Button(
              isBusy: false,
              onPressed: () => viewModel.handleLogin(),
            ),
          ],
        )
      ],
    );
  }
}
