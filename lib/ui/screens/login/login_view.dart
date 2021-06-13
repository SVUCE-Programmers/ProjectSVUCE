import 'package:flutter/material.dart';

import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/ui/widgets/lazy_indexed_stack.dart';

import 'consumers/login_view_body.dart';
import 'login_viewmodel.dart.dart';

class LoginView extends StatelessWidget {
  final _views = [
    LoginViewBody(
      isStudent: true,
    ),
    LoginViewBody(),
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<LoginViewModel>(
      viewModel: LoginViewModel(),
      disposeViewModel: false,
      builder: (context, uiHelpers, model) {
        return SafeArea(
          child: WillPopScope(
              onWillPop: model.showExitSnackbar,
              child: Scaffold(
                appBar: PreferredSize(
                  child: BottomNavigationBar(
                      backgroundColor: uiHelpers.backgroundColor,
                      fixedColor: uiHelpers.primaryColor,
                      currentIndex: model.index,
                      unselectedItemColor: uiHelpers.textSecondaryColor,
                      elevation: 0,
                      onTap: model.changeTab,
                      items: [
                        BottomNavigationBarItem(
                            icon: Icon(studentIcon), label: ("Student")),
                        BottomNavigationBarItem(
                            icon: Icon(facultyIcon), label: ("Teacher")),
                      ]),
                  preferredSize: Size(100, 100),
                ),
                body: LazyIndexedStack(
                  reuse: true,
                  index: model.index,
                  itemCount: _views.length,
                  itemBuilder: (_, index) => _views[index],
                ),
                bottomNavigationBar: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextButton(
                      onPressed: model.navigateToForgotPassword,
                      child: Text(
                        "Forgot Password?",
                        style: uiHelpers.title
                            .copyWith(color: uiHelpers.primaryColor),
                      ),
                    ),
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
              )),
        );
      },
    );
  }
}
