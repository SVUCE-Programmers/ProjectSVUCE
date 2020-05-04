import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/ui/utils/ui_helpers.dart';
import 'package:svuce_app/ui/views/login/login_viewmodel.dart.dart';
import 'package:svuce_app/ui/widgets/input_field.dart';
import 'package:svuce_app/ui/widgets/login_wrapper.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<LoginViewModel>(
      viewModel: LoginViewModel(),
      builder: (context, uiHelpers, model) {
        return LoginWrapper(
          student:
              loginView(isBusy: true, uiHelpers: uiHelpers, isStudent: true),
          teacher:
              loginView(isBusy: false, uiHelpers: uiHelpers, isStudent: false),
          info: PopupMenuButton(
            icon: Icon(
              Icons.help,
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
          continueAsGuest: () {
            print("Continue as Guest");
          },
        );
      },
    );
  }

  Widget loginView(
      {bool isStudent, UIHelpers uiHelpers, bool isBusy, Function login}) {
    return ListView(
      padding: EdgeInsets.all(20.0),
      children: <Widget>[
        Text.rich(TextSpan(children: [
          TextSpan(
            text: "Welcome Back\n",
            style: uiHelpers.headline.copyWith(color: textPrimaryColor),
          ),
          TextSpan(
            text: "Log in to your account to \ncontinue",
            style: uiHelpers.body.copyWith(color: textSecondaryColor),
          )
        ])),
        uiHelpers.verticalSpaceMedium,
        InputField(
          controller: null,
          title: "Your email here",
          keyboardType: TextInputType.emailAddress,
          iconData: EvaIcons.email,
        ),
        InputField(
          controller: null,
          title: "Your password here",
          keyboardType: TextInputType.emailAddress,
          iconData: EvaIcons.lock,
          isSecure: true,
        ),
        Row(
          mainAxisAlignment: isStudent
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            isStudent
                ? FlatButton(
                    padding: EdgeInsets.all(10.0),
                    onPressed: () {},
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "If you don\'t have an \naccount,",
                          style: uiHelpers.body
                              .copyWith(color: textSecondaryColor)),
                      TextSpan(
                          text: " Signup",
                          style: uiHelpers.body.copyWith(color: primaryColor)),
                    ])))
                : SizedBox(),
            FloatingActionButton(
                elevation: 0,
                backgroundColor: primaryColor,
                foregroundColor: backgroundColor,
                child: isBusy
                    ? CircularProgressIndicator()
                    : Icon(Icons.arrow_forward),
                onPressed: login ?? null),
          ],
        )
      ],
    );
  }
}
