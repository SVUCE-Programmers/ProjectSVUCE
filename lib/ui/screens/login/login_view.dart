import 'package:flutter/material.dart';

import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/ui/utils/text_field.dart';
import 'package:svuce_app/ui/widgets/animations/fade_transition.dart';
import 'package:svuce_app/ui/widgets/button.dart';

import 'login_viewmodel.dart.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<LoginViewModel>(
      viewModel: LoginViewModel(),
      disposeViewModel: false,
      builder: (context, uiHelpers, model) {
        return WillPopScope(
            onWillPop: model.showExitSnackbar,
            child: Builder(builder: (context) {
              return Scaffold(
                resizeToAvoidBottomInset: false,
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        uiHelpers.verticalSpaceMedium,
                        Text.rich(TextSpan(children: [
                          TextSpan(
                            text: "💐 Welcome Back, \n",
                            style: uiHelpers.headline
                                .copyWith(color: uiHelpers.textPrimaryColor),
                          ),
                          TextSpan(
                            text: "Log in to your account to \ncontinue",
                            style: uiHelpers.body
                                .copyWith(color: uiHelpers.textSecondaryColor),
                          )
                        ])),
                        uiHelpers.verticalSpaceLow,
                        AnimatedInputField(
                            prefixIcon: Icon(emailIcon),
                            title: "Email",
                            textEditingController: model.emailController),
                        AnimatedInputField(
                            isObscure: true,
                            prefixIcon: Icon(passwordIcon),
                            title: "Password",
                            textEditingController: model.passwordController),
                        FadeAnimation(
                          delay: 1.2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              TextButton(
                                  onPressed: model.gotoSignup,
                                  child: Text.rich(TextSpan(children: [
                                    TextSpan(
                                        text:
                                            "If you don\'t have an \naccount,",
                                        style: uiHelpers.body.copyWith(
                                            color:
                                                uiHelpers.textSecondaryColor)),
                                    TextSpan(
                                        text: " Signup",
                                        style: uiHelpers.body.copyWith(
                                            color: uiHelpers.primaryColor)),
                                  ]))),
                              Button(
                                isBusy: false,
                                onPressed: () => model.handleLogin(),
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
                bottomNavigationBar: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    MaterialButton(
                      onPressed: () => model.navigateToForgotPassword(),
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: uiHelpers.primaryColor),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 25)
                          .copyWith(bottom: 15),
                      child: MaterialButton(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: uiHelpers.primaryColor)),
                        onPressed: model.continueAsGuest,
                        child: Center(
                          child: Text(
                            "Continue as Guest",
                            style: uiHelpers.title
                                .copyWith(color: uiHelpers.primaryColor),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }));
      },
    );
  }
}
