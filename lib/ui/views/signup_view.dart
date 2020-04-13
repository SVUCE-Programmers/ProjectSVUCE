import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:svuce_app/ui/shared/app_colors.dart';
import 'package:svuce_app/ui/shared/font_styles.dart';
import 'package:svuce_app/ui/shared/shared_styles.dart';
import 'package:svuce_app/ui/widgets/button_wrapper.dart';
import 'package:svuce_app/ui/widgets/custom_clipper.dart';
import 'package:svuce_app/viewmodels/signup_viewmodel.dart';

class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SignUpViewModel>.withConsumer(
        viewModel: SignUpViewModel(),
        builder: (context, model, child) => Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: secondaryDark,
            bottomNavigationBar: FlatButton(
              splashColor: secondaryLight,
              onPressed: model.gotoLogin,
              child: Text(
                "Already have an account? Login",
                style: bodyText.apply(color: primary),
              ),
            ),
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
                  TextSpan(text: 'Create\nAccount', style: heading),
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
                        decoration: textFieldDecoration,
                        child: TextField(
                          style: buttonText.copyWith(color: textPrimary),
                          controller: model.fullNameController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              border: textFieldInputBorder,
                              prefixIcon: Icon(
                                FontAwesome.user,
                                color: textPrimary,
                              ),
                              hintText: 'Full Name',
                              hintStyle:
                                  buttonText.copyWith(color: textPrimary)),
                        ),
                      ),
                      WidgetWrapper(
                        decoration: textFieldDecoration,
                        child: TextField(
                          style: buttonText.copyWith(color: textPrimary),
                          controller: model.rollNoController,
                          keyboardType: TextInputType.phone,
                          maxLength: 8,
                          decoration: InputDecoration(
                              border: textFieldInputBorder,
                              prefixIcon: Icon(
                                FontAwesome.id_badge,
                                color: textPrimary,
                              ),
                              hintText: 'Roll no.',
                              counterText: '',
                              hintStyle:
                                  buttonText.copyWith(color: textPrimary)),
                        ),
                      ),
                      WidgetWrapper(
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
                            splashColor: secondaryLight,
                            onPressed: model.createUser,
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
                    ],
                  ),
                ),
              ),
            ])));
  }
}
