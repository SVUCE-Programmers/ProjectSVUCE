import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
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

  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<CreateProfileViewModel>(
      viewModel: CreateProfileViewModel(),
      onModelReady: (model) => model.init(email, password),
      builder: (context, uiHelpers, model) {
        return Scaffold(
          appBar: PreferredSize(
              child: Theme(
                data: ThemeData(
                    canvasColor: backgroundColor, fontFamily: 'Quicksand'),
                child: BottomNavigationBar(
                    elevation: 0,
                    fixedColor: primaryColor,
                    unselectedItemColor: textSecondaryColor,
                    currentIndex: model.currentPage,
                    items: [
                      BottomNavigationBarItem(
                          icon: Icon(MaterialCommunityIcons.numeric_1_circle),
                          title: Text("Profile Image")),
                      BottomNavigationBarItem(
                          icon: Icon(MaterialCommunityIcons.numeric_2_circle),
                          title: Text("Basic Details")),
                      BottomNavigationBarItem(
                          icon: Icon(MaterialCommunityIcons.numeric_3_circle),
                          title: Text("Contact Details")),
                    ]),
              ),
              preferredSize: Size(100, 100)),
          body: Container(
            padding: EdgeInsets.all(20.0),
            child: IndexedStack(
              index: model.currentPage,
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
                      isBusy: false,
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
