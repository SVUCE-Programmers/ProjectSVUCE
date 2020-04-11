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
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                        TextSpan(text: 'Student Version\n', style: subhead),
                      ])),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 150),
                          alignment: Alignment.center,
                          child: ListView(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            children: <Widget>[
                              WidgetWrapper(
                                decoration: textFieldDecoration,
                                child: TextField(
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: secondaryLight)),
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
                                  controller: passwordController,
                                  obscureText: true,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: secondaryLight)),
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
                                      model.login(
                                          email: "themightyking117@gmail.com",
                                          password: "1231321");
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
                              WidgetWrapper(
                                decoration: buttonDecoration,
                                child: FlatButton(
                                    splashColor: secondaryLight,
                                    onPressed: () {
                                      // TODO: Navigate to CreateAccount
                                    },
                                    child: Text(
                                      "Create Account",
                                      style: buttonText.apply(color: primary),
                                    )),
                              ),
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
