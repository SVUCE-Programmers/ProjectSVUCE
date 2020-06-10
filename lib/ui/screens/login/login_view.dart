import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/app/theme.dart';
import 'package:svuce_app/ui/screens/login/consumers/login_body.dart';
import 'package:svuce_app/ui/screens/main/widgets/lazy_indexed_stack.dart';

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
            onWillPop: model.onWillPop,
            child: Scaffold(
              appBar: PreferredSize(
                child: Theme(
                    data: commonThemeData,
                    child: BottomNavigationBar(
                        fixedColor: primaryColor,
                        currentIndex: model.index,
                        unselectedItemColor: textSecondaryColor,
                        elevation: 0,
                        onTap: model.changeTab,
                        items: [
                          BottomNavigationBarItem(
                              icon: Icon(studentIcon), title: Text("Student")),
                          BottomNavigationBarItem(
                              icon: Icon(facultyIcon), title: Text("Teacher")),
                        ])),
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
                  FlatButton(
                    textColor: primaryColor,
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: primaryColor, width: 4),
                        borderRadius: BorderRadius.circular(10)),
                    child: FlatButton(
                      textColor: primaryColor,
                      onPressed: () {},
                      child: Text(
                        "Continue as Guest",
                      ),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
