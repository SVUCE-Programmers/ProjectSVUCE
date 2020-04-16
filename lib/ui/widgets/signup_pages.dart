import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:svuce_app/ui/shared/app_colors.dart';
import 'package:svuce_app/ui/shared/font_styles.dart';
import 'package:svuce_app/ui/shared/shared_styles.dart';
import 'package:svuce_app/ui/widgets/button_wrapper.dart';
import 'package:svuce_app/viewmodels/signup_viewmodel.dart';

Widget pageOne(SignUpViewModel model) {
  return Form(
    key: model.pageOneForm,
    child: ListView(
      shrinkWrap: true,
      children: <Widget>[
        WidgetWrapper(
          decoration: textFieldDecoration,
          child: TextFormField(
            style: buttonText.copyWith(color: textPrimary),
            controller: model.fullNameController,
            keyboardType: TextInputType.text,
            validator: model.validateName,
            decoration: InputDecoration(
                border: textFieldInputBorder,
                prefixIcon: Icon(
                  FontAwesome.user,
                  color: textPrimary,
                ),
                hintText: 'Full Name',
                hintStyle: buttonText.copyWith(color: textPrimary)),
          ),
        ),
        WidgetWrapper(
          decoration: textFieldDecoration,
          child: TextFormField(
            validator: model.validateRollNo,
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
                hintStyle: buttonText.copyWith(color: textPrimary)),
          ),
        ),
        WidgetWrapper(
          decoration: textFieldDecoration,
          child: ListTile(
            title: Text(
              "College",
              style: buttonText,
            ),
            trailing: Text(
              "SVUCE",
              style: buttonText.apply(color: primary),
            ),
          ),
        ),
        WidgetWrapper(
          decoration: buttonDecoration.copyWith(color: primary),
          child: FlatButton(
              splashColor: secondaryLight,
              onPressed: model.gotoNextPage,
              child: model.busy
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(secondaryDark),
                    )
                  : Text(
                      "Next",
                      style: buttonText.apply(color: secondaryDark),
                    )),
        ),
      ],
    ),
  );
}

Widget pageTwo(SignUpViewModel model) {
  return Form(
    key: model.pageTwoForm,
    child: ListView(
      shrinkWrap: true,
      children: <Widget>[
        WidgetWrapper(
          decoration: textFieldDecoration,
          child: TextFormField(
            validator: model.validateEmail,
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
                hintStyle: buttonText.copyWith(color: textPrimary)),
          ),
        ),
        WidgetWrapper(
          decoration: textFieldDecoration,
          child: TextFormField(
            validator: model.validatePassword,
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
                hintStyle: buttonText.copyWith(color: textPrimary)),
          ),
        ),
        WidgetWrapper(
          decoration: buttonDecoration.copyWith(color: primary),
          child: FlatButton(
              splashColor: secondaryLight,
              onPressed: model.createUser,
              child: model.busy
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(secondaryDark),
                    )
                  : Text(
                      "Signup",
                      style: buttonText.apply(color: secondaryDark),
                    )),
        ),
      ],
    ),
  );
}
