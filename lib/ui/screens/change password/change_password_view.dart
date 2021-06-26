import 'package:flutter/material.dart';
import 'package:svuce_app/app/configs.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/ui/screens/change%20password/change_password_view_model.dart';
import 'package:svuce_app/ui/utils/button_animation.dart';
import 'package:svuce_app/ui/utils/text_field.dart';

class ChangePasswordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<ChangePasswordViewModel>(
        builder: (context, uiHelpers, model) => Scaffold(
              appBar: AppBar(
                title: Text(
                  "Change Password",
                  style: uiHelpers.headline,
                ),
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: IconButton(
                    onPressed: model.goBack,
                    icon: Icon(
                      backIcon,
                      color: uiHelpers.textPrimaryColor,
                    )),
              ),
              body: Form(
                key: model.formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20)
                        .copyWith(top: 20),
                    child: Column(
                      children: [
                        AnimatedInputField(
                            validator: Validators.validatePassword,
                            fadeDuration: Duration(seconds: 1),
                            yDistance: 100,
                            isObscure: true,
                            title: "Old Password",
                            textEditingController: model.passController),
                        AnimatedInputField(
                            validator: Validators.validatePassword,
                            fadeDuration: Duration(seconds: 1),
                            yDistance: 100,
                            isObscure: true,
                            title: "New Password",
                            textEditingController: model.newPassController),
                        AnimatedButton(
                          fadeDuration: Duration(seconds: 1),
                          yDistance: 50,
                          onTap: () => model.changePassword(),
                          title: Text(
                            "Change Password",
                            style: uiHelpers.button,
                          ),
                        )
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                ),
              ),
            ),
        viewModel: ChangePasswordViewModel());
  }
}
