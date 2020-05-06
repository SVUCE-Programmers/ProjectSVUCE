import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/ui/widgets/button.dart';
import 'package:svuce_app/ui/widgets/image_source_select.dart';

import 'consumers/basic_details.dart';
import 'consumers/contact_details.dart';
import 'consumers/select_profile_image.dart';
import 'create_profile_viewmodel.dart';

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
              physics: NeverScrollableScrollPhysics(),
              controller: model.pageController,
              children: <Widget>[
                SelectProfileImage(uiHelpers),
                BasicDetails(uiHelpers),
                ContactDetails(uiHelpers),
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
                continueWithNoImage: () => model.removePhoto(),
              )),
        );
      },
    );
  }
}
