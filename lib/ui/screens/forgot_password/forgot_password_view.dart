import 'package:flutter/material.dart';

import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/core/mixins/validators.dart';
import 'package:svuce_app/ui/utils/text_field.dart';
import 'package:svuce_app/ui/widgets/animations/fade_transition.dart';
import 'package:svuce_app/ui/widgets/button.dart';

import 'forgot_password_viewmodel.dart';

class ForgotPasswordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<ForgotPasswordViewModel>(
      enableConnectionStream: true,
      viewModel: ForgotPasswordViewModel(),
      builder: (context, uiHelpers, model) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
                icon: Icon(
                  backIcon,
                  color: uiHelpers.textPrimaryColor,
                ),
                onPressed: model.goBack),
            title: Text(
              "Forgot Password",
              style: uiHelpers.headline
                  .copyWith(color: uiHelpers.textPrimaryColor),
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
                  style: uiHelpers.body
                      .copyWith(color: uiHelpers.textSecondaryColor),
                ),
                AnimatedInputField(
                  title: "Enter your email..",
                  prefixIcon: Icon(emailIcon),
                  validator: Validators.validateEmail,
                  textEditingController: model.emailController,
                  textInputType: TextInputType.emailAddress,
                ),
                FadeAnimation(
                  yDistance: 30,
                  delay: 1,
                  xDistance: 0,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Button(
                      isBusy: false,
                      onPressed: model.resetPassword,
                    ),
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
