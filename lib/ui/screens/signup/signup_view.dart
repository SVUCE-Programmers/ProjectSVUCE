import 'package:flutter/material.dart';

import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/ui/widgets/button.dart';
import 'package:svuce_app/ui/widgets/input_field.dart';

import 'signup_viewmodel.dart';

class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<SignUpViewModel>(
      viewModel: SignUpViewModel(),
      builder: (context, uiHelpers, model) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
                icon: Icon(
                  backIcon,
                  color: uiHelpers.textPrimaryColor,
                ),
                onPressed: model.gotoLogin),
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.info,
                    color: uiHelpers.primaryColor,
                  ),
                  onPressed: null)
            ],
          ),
          body: ListView(
            padding: EdgeInsets.all(20.0),
            children: <Widget>[
              Text.rich(TextSpan(children: [
                TextSpan(
                  text: "Hi There,\n",
                  style: uiHelpers.headline
                      .copyWith(color: uiHelpers.textPrimaryColor),
                ),
                TextSpan(
                  text: "Enter your information\nbelow to continue",
                  style: uiHelpers.body
                      .copyWith(color: uiHelpers.textSecondaryColor),
                )
              ])),
              uiHelpers.verticalSpaceMedium,
              InputField(
                title: "Your email here..",
                keyboardType: TextInputType.emailAddress,
                iconData: emailIcon,
                error: model.emailError,
                validator: model.updateEmail,
              ),
              InputField(
                title: "Your password here",
                keyboardType: TextInputType.text,
                iconData: passwordIcon,
                isSecure: true,
                error: model.passwordError,
                validator: model.updatePassword,
              ),
              InputField(
                title: "Your password once again",
                keyboardType: TextInputType.text,
                iconData: passwordIcon,
                isSecure: true,
                error: model.confirmPasswordError,
                validator: model.updateConfirmPassword,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                      padding: EdgeInsets.all(10.0),
                      onPressed: model.gotoLogin,
                      child: Text.rich(TextSpan(children: [
                        TextSpan(
                            text: "If you already have an \naccount,",
                            style: uiHelpers.body
                                .copyWith(color: uiHelpers.textSecondaryColor)),
                        TextSpan(
                            text: " Login",
                            style: uiHelpers.body
                                .copyWith(color: uiHelpers.primaryColor)),
                      ]))),
                  Button(
                    isBusy: model.isBusy,
                    onPressed: model.handleSignup,
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
