import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:svuce_app/ui/shared/app_colors.dart';
import 'package:svuce_app/ui/shared/font_styles.dart';
import 'package:svuce_app/ui/shared/shared_styles.dart';
import 'package:svuce_app/ui/widgets/button_wrapper.dart';
import 'package:svuce_app/ui/widgets/custom_clipper.dart';
import 'package:svuce_app/viewmodels/login_viewmodel.dart';

class LoginView extends StatelessWidget {
  final bool isStudent;

  const LoginView({isStudent})
      : this.isStudent = isStudent != null ? isStudent : true;

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<LoginViewModel>.withConsumer(
        viewModel: LoginViewModel(),
        builder: (context, model, child) => Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: secondaryDark,
            bottomNavigationBar: isStudent
                ? Container(
                    margin: EdgeInsets.all(20.0),
                    decoration: buttonDecoration,
                    child: FlatButton(
                        splashColor: secondaryLight,
                        onPressed: model.gotoCreateAccount,
                        child: Text(
                          "Create Account",
                          style: buttonText.apply(color: primary),
                        )),
                  )
                : SizedBox(),
            body: Stack(fit: StackFit.expand, children: <Widget>[
              ClipPath(
                clipper: CurveClipper(),
                child: Container(
                  decoration: BoxDecoration(
                    color: primary,
                  ),
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
                child: Text.rich(TextSpan(children: [
                  TextSpan(text: 'Login\n', style: heading),
                  TextSpan(
                      text: isStudent
                          ? 'Student Version\n'
                          : 'Teacher Version \n',
                      style: subhead),
                ])),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.only(top: 150),
                child: Center(
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      WidgetWrapper(
                        key: Key("EmailField"),
                        decoration: textFieldDecoration,
                        child: TextField(
                          style: buttonText.copyWith(color: textPrimary),
                          controller: model.emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              border: textFieldInputBorder,
                              prefixIcon: Icon(
                                FontAwesome.envelope,
                                color: textPrimary,
                              ),
                              hintText: 'Email',
                              hintStyle:
                                  buttonText.copyWith(color: textPrimary)),
                        ),
                      ),
                      WidgetWrapper(
                        decoration: textFieldDecoration,
                        child: TextField(
                          key: Key("PasswordField"),
                          style: buttonText.copyWith(color: textPrimary),
                          controller: model.passwordController,
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              border: textFieldInputBorder,
                              prefixIcon: Icon(
                                FontAwesome.lock,
                                color: textPrimary,
                              ),
                              hintText: 'Password',
                              hintStyle:
                                  buttonText.copyWith(color: textPrimary)),
                        ),
                      ),
                      WidgetWrapper(
                        decoration: buttonDecoration.copyWith(color: primary),
                        child: FlatButton(
                            key: Key("SigninButton"),
                            splashColor: secondaryLight,
                            onPressed: model.login,
                            child: model.busy
                                ? CircularProgressIndicator(
                                    valueColor:
                                        AlwaysStoppedAnimation(secondaryDark),
                                  )
                                : Text(
                                    model.buttonText,
                                    style:
                                        buttonText.apply(color: secondaryDark),
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
                    ],
                  ),
                ),
              ),
            ])));
  }
}
