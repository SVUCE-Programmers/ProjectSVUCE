import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/ui/widgets/input_field.dart';

import 'forgot_password_viewmodel.dart';

class ForgotPasswordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<ForgotPasswordViewModel>(
      viewModel: ForgotPasswordViewModel(),
      builder: (context, uiHelpers, model) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              "Forgot Password",
              style: uiHelpers.headline.copyWith(color: Colors.white),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
          ),
          body: ListView(
            padding: EdgeInsets.all(20.0),
            children: <Widget>[
              InputField(
                title: "Enter your email..",
                iconData: EvaIcons.email,
                keyboardType: TextInputType.emailAddress,
              )
            ],
          ),
        );
      },
    );
  }
}
