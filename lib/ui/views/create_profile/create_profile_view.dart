import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/ui/widgets/button.dart';
import 'package:svuce_app/ui/widgets/input_field.dart';

import 'create_profile_viewmodel.dart';

class CreateProfileView extends StatelessWidget {
  final String email;
  final String password;

  const CreateProfileView({Key key, this.email, this.password})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<CreateProfileViewModel>(
      viewModel: CreateProfileViewModel(),
      builder: (context, uiHelpers, model) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Create Profile",
              style: uiHelpers.headline.copyWith(color: textPrimaryColor),
            ),
            leading: null,
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: ListView(
            padding: EdgeInsets.all(20.0),
            children: <Widget>[
              InputField(
                title: "Full Name",
                iconData: EvaIcons.person,
              )
            ],
          ),
          floatingActionButton: Button(
            isBusy: false,
            onPressed: () {},
          ),
        );
      },
    );
  }
}
