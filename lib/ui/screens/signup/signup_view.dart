import 'package:flutter/material.dart';

import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/ui/utils/text_field.dart';
import 'package:svuce_app/ui/widgets/animations/fade_transition.dart';
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
                onPressed: () {},
                icon: Icon(
                  Icons.info,
                  color: uiHelpers.primaryColor,
                ),
              )
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
              IgnorePointer(
                ignoring: model.isEmailVerified,
                child: AnimatedInputField(
                  title: "Email",
                  textInputType: TextInputType.text,
                  prefixIcon: Icon(emailIcon),
                  isObscure: false,
                  textEditingController: model.emailController,
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 800),
                height: !model.isEmailVerified ? 0 : 160,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedInputField(
                        title: "Password",
                        textInputType: TextInputType.text,
                        prefixIcon: Icon(passwordIcon),
                        isObscure: true,
                        textEditingController: model.passController,
                      ),
                      AnimatedInputField(
                        title: "Confirm Password",
                        textInputType: TextInputType.text,
                        prefixIcon: Icon(passwordIcon),
                        isObscure: true,
                        textEditingController: model.confirmPassController,
                      ),
                    ],
                  ),
                ),
              ),
              FadeAnimation(
                delay: 1.7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                        onPressed: model.gotoLogin,
                        child: Text.rich(TextSpan(children: [
                          TextSpan(
                              text: "If you already have an \naccount,",
                              style: uiHelpers.body.copyWith(
                                  color: uiHelpers.textSecondaryColor)),
                          TextSpan(
                              text: " Login",
                              style: uiHelpers.body
                                  .copyWith(color: uiHelpers.primaryColor)),
                        ]))),
                    Button(
                      isBusy: false,
                      onPressed: model.handleSignup,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
