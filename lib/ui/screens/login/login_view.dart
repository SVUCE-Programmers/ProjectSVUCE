import 'package:flutter/material.dart';

import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/ui/screens/login/consumers/login_body.dart';
import 'package:svuce_app/ui/widgets/lazy_indexed_stack.dart';

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
      viewModel: locator<LoginViewModel>(),
      disposeViewModel: false,
      builder: (context, uiHelpers, model) {
        return WillPopScope(
            onWillPop: model.showExitSnackbar,
            child: Scaffold(
              appBar: PreferredSize(
                child: BottomNavigationBar(
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
                  MaterialButton(
                    onPressed: () {},
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
                      onPressed: () {},
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
            ));
      },
    );
  }
}
