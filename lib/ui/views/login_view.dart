import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:svuce_app/ui/shared/app_colors.dart';
import 'package:svuce_app/ui/shared/font_styles.dart';
import 'package:svuce_app/ui/shared/shared_styles.dart';
import 'package:svuce_app/ui/shared/ui_helpers.dart';
import 'package:svuce_app/ui/widgets/button_wrapper.dart';
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
            backgroundColor: secondaryDark,
            bottomNavigationBar: isStudent
                ? Container(
                    margin: EdgeInsets.all(20.0),
                    decoration: buttonDecoration,
                    child: FlatButton(
                        splashColor: secondaryLight,
                        onPressed: model.gotoSignup,
                        child: Text(
                          "Create Account",
                          style: buttonText.apply(color: primary),
                        )),
                  )
                : SizedBox(),
            body: Stack(fit: StackFit.expand, children: <Widget>[
              Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
                  child: ListTile(
                    title: Text.rich(TextSpan(children: [
                      TextSpan(text: 'Login\n', style: heading),
                      TextSpan(
                          text: isStudent
                              ? 'Student Version\n'
                              : 'Teacher Version \n',
                          style: subhead),
                    ])),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.help,
                          color: secondary,
                        ),
                        onPressed: () {}),
                  )),
              Container(
                  height: double.infinity,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 3),
                  child: Form(
                      key: model.formKey,
                      child: ListView(
                        padding: EdgeInsets.symmetric(
                            vertical: 30.0, horizontal: 20.0),
                        children: <Widget>[
                          WidgetWrapper(
                            key: Key("EmailField"),
                            decoration: textFieldDecoration,
                            child: TextFormField(
                              style: buttonText.copyWith(color: textPrimary),
                              controller: model.emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: model.validateEmail,
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
                            child: TextFormField(
                              key: Key("PasswordField"),
                              style: buttonText.copyWith(color: textPrimary),
                              controller: model.passwordController,
                              validator: model.validatePassword,
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
                          Align(
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                onTap: model.gotoForgotPassword,
                                child: Text(
                                  "Forgot Password",
                                  style: TextStyle(color: primary),
                                ),
                              )),
                          verticalSpaceLow,
                          WidgetWrapper(
                            decoration:
                                buttonDecoration.copyWith(color: primary),
                            child: FlatButton(
                                key: Key("SigninButton"),
                                splashColor: secondaryLight,
                                onPressed: model.login,
                                child: model.busy
                                    ? CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation(
                                            secondaryDark),
                                      )
                                    : Text(
                                        "Sign in",
                                        style: buttonText.apply(
                                            color: secondaryDark),
                                      )),
                          ),
                        ],
                      ))),
            ])));
  }
}
