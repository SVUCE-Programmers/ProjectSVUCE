import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:svuce_app/app/colors.dart';
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
    final UIHelpers uiHelpers = UIHelpers.fromContext(context);

    return ListView(
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
          title: "Your email here..",
          keyboardType: TextInputType.emailAddress,
          iconData: emailIcon,
          validator: viewModel.validateEmail,
        ),
        InputField(
          title: "Your password here",
          keyboardType: TextInputType.text,
          iconData: passwordIcon,
          isSecure: true,
          validator: viewModel.validatePassword,
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
                    onPressed: viewModel.gotoSignup,
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "If you don\'t have an \naccount,",
                          style: uiHelpers.body
                              .copyWith(color: textSecondaryColor)),
                      TextSpan(
                          text: " Signup",
                          style: uiHelpers.body.copyWith(color: primaryColor)),
                    ])))
                : SizedBox(),
            Button(
              isBusy: viewModel.isBusy,
              onPressed: () => viewModel.handleLogin(isStudent: isStudent),
            ),
          ],
        )
      ],
    );
  }
}
