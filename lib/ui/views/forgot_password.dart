import 'package:flutter/material.dart';
import 'package:provider_architecture/viewmodel_provider.dart';
import 'package:svuce_app/ui/shared/app_colors.dart';
import 'package:svuce_app/ui/shared/font_styles.dart';
import 'package:svuce_app/ui/shared/shared_styles.dart';
import 'package:svuce_app/ui/widgets/button_wrapper.dart';
import 'package:svuce_app/viewmodels/forgot_password_viewmodel.dart';
class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ForgotViewModel>.withConsumer(
      viewModel: ForgotViewModel(),
      builder:(context, model, child)=>Scaffold(
        appBar: AppBar(
          title: Text("Forgot Password"),
          centerTitle: true,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: secondaryDark,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left:10.0,right: 10,bottom: 20),
                child: Text("To Recover your password,you need to enter your registered email address.We will send the recovery code to your email"),
              ),
              Padding(
                padding: const EdgeInsets.only(left:15.0,right: 15),
                child: WidgetWrapper(
                  decoration: textFieldDecoration,
                  child: TextFormField(
                    key: Key("PasswordField"),
                    style: buttonText.copyWith(color: textPrimary),
                    controller: model.emailTextEditingController,
                    validator: model.validate,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        border: textFieldInputBorder,
                        prefixIcon: Icon(
                          Icons.email,
                          color: textPrimary,
                        ),
                        hintText: 'Email Password',
                        hintStyle:
                            buttonText.copyWith(color: textPrimary)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right:15.0,left:15.0),
                child: WidgetWrapper(
                  decoration:
                      buttonDecoration.copyWith(color: primary),
                  child: FlatButton(
                      key: Key("SigninButton"),
                      splashColor: secondaryLight,
                      onPressed: model.resetPass,
                      child: model.busy
                          ? CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(
                                  secondaryDark),
                            )
                          : Text(
                              "Reset Password",
                              style: buttonText.apply(
                                  color: secondaryDark),
                            )),
                ),
              ),
            ],
          ),
        ),
      ) ,      
    );
  }
}