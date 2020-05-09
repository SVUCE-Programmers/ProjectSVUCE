import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/ui/views/login/login_viewmodel.dart.dart';

import 'login_pages.dart';
import 'login_wrapper.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<LoginViewModel>(
      viewModel: locator<LoginViewModel>(),
      disposeViewModel: false,
      builder: (context, uiHelpers, model) {
        return WillPopScope(
          onWillPop: model.onWillPop,
          child: LoginWrapper(
            student: LoginPage(uiHelpers: uiHelpers, isStudent: true),
            teacher: LoginPage(uiHelpers: uiHelpers, isStudent: false),
            info: PopupMenuButton(
              icon: Icon(
                infoIcon,
                color: primaryColor,
              ),
              color: surfaceColor,
              onSelected: model.handlePopUp,
              itemBuilder: (BuildContext context) {
                return model.popUpMenuItems
                    .map((item) => PopupMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(color: textPrimaryColor),
                        )))
                    .toList();
              },
            ),
            continueAsGuest: model.continueAsGuest,
          ),
        );
      },
    );
  }
}
