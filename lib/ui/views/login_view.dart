import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:svuce_app/ui/shared/app_colors.dart';
import 'package:svuce_app/ui/shared/font_styles.dart';
import 'package:svuce_app/ui/shared/shared_styles.dart';
import 'package:svuce_app/ui/widgets/button_wrapper.dart';
import 'package:svuce_app/ui/widgets/curve_wrapper.dart';
import 'package:svuce_app/viewmodels/login_viewmodel.dart';

class LoginView extends StatelessWidget {
  final bool isStudent;

  const LoginView({isStudent})
      : this.isStudent = isStudent != null ? isStudent : true;

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: secondaryLight));

    return ViewModelProvider<LoginViewModel>.withConsumer(
        viewModel: LoginViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: secondaryDark,
              body: CurveWrapper(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text.rich(TextSpan(children: [
                        TextSpan(text: 'Login\n', style: heading),
                        TextSpan(
                            text: isStudent
                                ? 'Student Version\n'
                                : 'Teacher Version \n',
                            style: subhead),
                      ])),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 150),
                          alignment: Alignment.center,
                          child: ListView(
                            shrinkWrap: true,
                            children: <Widget>[
                              WidgetWrapper(
                                decoration: textFieldDecoration,
                                child: TextField(
                                  controller: model.emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      border: inputBorder,
                                      prefixIcon: Icon(
                                        FontAwesome.envelope,
                                        color: textPrimary,
                                      ),
                                      hintText: 'Email',
                                      hintStyle: buttonText.copyWith(
                                          color: textPrimary)),
                                ),
                              ),
                              WidgetWrapper(
                                decoration: textFieldDecoration,
                                child: TextField(
                                  controller: model.passwordController,
                                  obscureText: true,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      border: inputBorder,
                                      prefixIcon: Icon(
                                        FontAwesome.lock,
                                        color: textPrimary,
                                      ),
                                      hintText: 'Password',
                                      hintStyle: buttonText.copyWith(
                                          color: textPrimary)),
                                ),
                              ),
                              WidgetWrapper(
                                decoration:
                                    buttonDecoration.copyWith(color: primary),
                                child: FlatButton(
                                    splashColor: secondaryLight,
                                    onPressed: () {
                                      model.login();
                                    },
                                    child: model.busy
                                        ? CircularProgressIndicator(
                                            valueColor: AlwaysStoppedAnimation(
                                                secondaryDark),
                                          )
                                        : Text(
                                            model.buttonText,
                                            style: buttonText.apply(
                                                color: secondaryDark),
                                          )),
                              ),
                              WidgetWrapper(
                                child: FlatButton(
                                    splashColor: secondaryLight,
                                    onPressed: () {
                                      //TODO: Forgot Password
                                    },
                                    child: Text(
                                      "Forgot Password?",
                                      style: bodyText.apply(color: primary),
                                    )),
                              ),
                              isStudent
                                  ? WidgetWrapper(
                                      decoration: buttonDecoration,
                                      child: FlatButton(
                                          splashColor: secondaryLight,
                                          onPressed: () {
                                            // TODO: Navigate to CreateAccount
                                          },
                                          child: Text(
                                            "Create Account",
                                            style: buttonText.apply(
                                                color: primary),
                                          )),
                                    )
                                  : SizedBox(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
