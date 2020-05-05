import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/ui/widgets/button.dart';
import 'package:svuce_app/ui/widgets/image_source_select.dart';
import 'package:svuce_app/ui/widgets/input_field.dart';

import 'create_profile_viewmodel.dart';
import 'select_profile_image.dart';

class CreateProfileView extends StatelessWidget {
  final String email;
  final String password;

  CreateProfileView({Key key, this.email, this.password}) : super(key: key);

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<CreateProfileViewModel>(
      viewModel: CreateProfileViewModel(),
      builder: (context, uiHelpers, model) {
        return Scaffold(
          key: _globalKey,
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
          body: Container(
            padding: EdgeInsets.all(20.0),
            child: PageView(
              onPageChanged: model.onPageChanged,
              // physics: NeverScrollableScrollPhysics(),
              controller: model.pageController,
              children: <Widget>[
                SelectProfileImage(
                  chooseImage: () => model.chooseImage(),
                  image: model.profileImage != null
                      ? FileImage(model.profileImage)
                      : null,
                ),
                ListView(
                  children: <Widget>[
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "Your Basic Details\n",
                          style: uiHelpers.title
                              .copyWith(color: textPrimaryColor)),
                      TextSpan(
                          text: "Drop your basic details here\n\n",
                          style: uiHelpers.body
                              .copyWith(color: textSecondaryColor)),
                    ])),
                    InputField(
                      iconData: EvaIcons.person,
                      title: "Your Full Name",
                      keyboardType: TextInputType.text,
                    ),
                    InputField(
                      iconData: EvaIcons.smartphone,
                      title: "Your Roll No.",
                      keyboardType: TextInputType.text,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: surfaceColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        leading: Icon(
                          FontAwesome5Solid.school,
                          color: primaryColor,
                        ),
                        title: Text(
                          "SVUCE",
                          style: uiHelpers.body
                              .copyWith(color: textSecondaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
                ListView(
                  children: <Widget>[
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "Your Contact Info\n",
                          style: uiHelpers.title
                              .copyWith(color: textPrimaryColor)),
                      TextSpan(
                          text:
                              "Enter your details to let others see your info.\n\n",
                          style: uiHelpers.body
                              .copyWith(color: textSecondaryColor)),
                    ])),
                    InputField(
                      iconData: EvaIcons.messageCircle,
                      title: "Your Contact",
                      keyboardType: TextInputType.text,
                    ),
                    InputField(
                      iconData: EvaIcons.bulb,
                      title: "Bio",
                      keyboardType: TextInputType.text,
                      maxLength: 150,
                      maxLines: 4,
                    ),
                  ],
                ),
              ],
            ),
          ),
          floatingActionButton: Container(
            padding: EdgeInsets.all(10.0),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Visibility(
                  visible: model.currentPage != 0,
                  child: Container(
                    margin: EdgeInsets.only(left: 30.0),
                    child: Button(
                      isBusy: model.isBusy,
                      isBack: true,
                      onPressed: model.moveBackward,
                    ),
                  ),
                ),
                Button(
                  isBusy: model.isBusy,
                  onPressed: model.moveForward,
                ),
              ],
            ),
          ),
          bottomNavigationBar: Visibility(
              visible: model.showBottomBar,
              child: ImageSourceSelect(
                selectFromCamera: () => model.selectImage,
                selectFromGallery: () => model.selectImage(fromGallery: true),
              )),
        );
      },
    );
  }
}
