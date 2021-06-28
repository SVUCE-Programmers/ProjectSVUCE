import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';
import 'package:svuce_app/ui/screens/login/login_viewmodel.dart.dart';
import 'package:svuce_app/ui/utils/text_field.dart';
import 'package:svuce_app/ui/widgets/animations/fade_transition.dart';
import 'package:svuce_app/ui/widgets/button.dart';

class LoginViewBody extends ViewModelWidget<LoginViewModel> {
  final bool isStudent;

  LoginViewBody({this.isStudent = false});

  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {
    final UiHelpers uiHelpers = UiHelpers.fromContext(context);

    return ListView(
      padding: EdgeInsets.all(20.0),
      children: <Widget>[
        Container(
          height: uiHelpers.height * 0.25,
          child: Lottie.asset("assets/lottie/login.json",
              repeat: false, alignment: Alignment.bottomCenter),
        ),
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
        AnimatedInputField(
          downPadding: 0,
          textEditingController: viewModel.emailController,
          title: "Email",
          textInputType: TextInputType.emailAddress,
          prefixIcon: Icon(emailIcon),
        ),
        AnimatedInputField(
          rowWidget: MaterialButton(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onPressed: viewModel.navigateToForgotPassword,
              child: Text(
                "Forgot Password",
                style: uiHelpers.body.copyWith(color: uiHelpers.primaryColor),
              )),
          textEditingController: viewModel.passwordController,
          title: "Password",
          isObscure: true,
          textInputType: TextInputType.text,
          prefixIcon: Icon(passwordIcon),
        ),
        FadeAnimation(
          delay: 1,
          yDistance: 30,
          xDistance: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextButton(
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
                  ]))),
              Button(
                isBusy: viewModel.isBusy,
                onPressed: () => viewModel.handleLogin(),
              ),
            ],
          ),
        )
      ],
    );
  }
}
