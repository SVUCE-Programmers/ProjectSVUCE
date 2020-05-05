import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:stacked/_viewmodel_widget.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/ui/utils/ui_helpers.dart';
import 'package:svuce_app/ui/views/login/login_viewmodel.dart.dart';
import 'package:svuce_app/ui/widgets/button.dart';
import 'package:svuce_app/ui/widgets/input_field.dart';

class LoginPage extends ViewModelWidget<LoginViewModel> {
  final bool isStudent;
  final UIHelpers uiHelpers;

  LoginPage({Key key, this.isStudent, this.uiHelpers});

  @override
  Widget build(BuildContext context, LoginViewModel model) {
    return Form(
      key: model.formKey,
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
            iconData: EvaIcons.email,
            validator: model.validateEmail,
          ),
          InputField(
            controller: model.passwordController,
            title: "Your password here",
            keyboardType: TextInputType.emailAddress,
            iconData: EvaIcons.lock,
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
                onPressed: model.handleLogin,
              ),
            ],
          )
        ],
      ),
    );
  }
}
