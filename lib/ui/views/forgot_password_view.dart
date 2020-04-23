import 'package:flutter/material.dart';
import 'package:provider_architecture/viewmodel_provider.dart';
import 'package:svuce_app/ui/shared/app_colors.dart';
import 'package:svuce_app/ui/shared/font_styles.dart';
import 'package:svuce_app/ui/shared/shared_styles.dart';
import 'package:svuce_app/ui/widgets/button_wrapper.dart';
import 'package:svuce_app/viewmodels/forgot_password_viewmodel.dart';

class ForgotPasswordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ForgotViewModel>.withConsumer(
      viewModel: ForgotViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text("Forgot Password"),
          centerTitle: true,
        ),
        body: Form(
          key: model.formKey,
          child: Container(
            alignment: Alignment.center,
            color: secondaryDark,
            margin: const EdgeInsets.all(20.0),
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20.0),
              children: <Widget>[
                Text(
                  'Enter your registered email and we\'ll send you the mail to reset your password\n',
                  style: bodyText,
                ),
                WidgetWrapper(
                  decoration: textFieldDecoration,
                  child: TextFormField(
                    style: buttonText.copyWith(color: textPrimary),
                    controller: model.emailTextEditingController,
                    validator: model.validateEmail,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        border: textFieldInputBorder,
                        prefixIcon: Icon(
                          Icons.email,
                          color: textPrimary,
                        ),
                        hintText: 'Your Email',
                        hintStyle: buttonText.copyWith(color: textPrimary)),
                  ),
                ),
                WidgetWrapper(
                  decoration: buttonDecoration.copyWith(color: primary),
                  child: FlatButton(
                      key: Key("SigninButton"),
                      splashColor: secondaryLight,
                      onPressed: model.resetPassword,
                      child: model.busy
                          ? CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(secondaryDark),
                            )
                          : Text(
                              "Reset Password",
                              style: buttonText.apply(color: secondaryDark),
                            )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
