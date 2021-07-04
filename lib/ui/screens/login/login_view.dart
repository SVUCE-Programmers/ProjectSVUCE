import 'package:flutter/material.dart';

import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/ui/screens/login/consumers/login_view_body.dart';

import 'login_viewmodel.dart.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<LoginViewModel>(
      enableConnectionStream: true,
      viewModel: LoginViewModel(),
      disposeViewModel: false,
      builder: (context, uiHelpers, model) {
        return SafeArea(
          child: WillPopScope(
            onWillPop: model.showExitSnackbar,
            child: Form(
              key: model.formKey,
              child: Scaffold(
                body: LoginViewBody(),
                bottomNavigationBar: MediaQuery.of(context).viewInsets.bottom !=
                        0
                    ? SizedBox()
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(12.0),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: uiHelpers.primaryColor, width: 2),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextButton(
                              onPressed: model.continueAsGuest,
                              child: Text(
                                "Continue as Guest",
                                style: uiHelpers.title
                                    .copyWith(color: uiHelpers.primaryColor),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
