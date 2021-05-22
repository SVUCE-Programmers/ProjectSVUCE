import 'package:flutter/material.dart';

import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/theme.dart';
import 'package:svuce_app/ui/screens/create_profile/data/items.dart';
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
        return WillPopScope(
          onWillPop: model.showExitSnackbar,
          child: Scaffold(
            appBar: PreferredSize(
                child: BottomNavigationBar(
                    elevation: 0,
                    fixedColor: uiHelpers.primaryColor,
                    unselectedItemColor: uiHelpers.textSecondaryColor,
                    currentIndex: model.currentPage,
                    items: topbarItems),
                preferredSize: Size(100, 100)),
            body: Container(
              padding: EdgeInsets.all(20.0),
              child: IndexedStack(
                index: model.currentPage,
                children: <Widget>[
                  BasicDetails(uiHelpers),
                  SelectProfileImage(uiHelpers),
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
                  model.currentPage != 0
                      ? Container(
                          margin: EdgeInsets.only(left: 30.0),
                          child: Button(
                            isBusy: false,
                            isBack: true,
                            onPressed: model.moveBackward,
                          ),
                        )
                      : SizedBox(),
                  model.currentPage == 2
                      ? Button(
                          isBusy: model.isBusy,
                          icon: Icons.done_all,
                          onPressed: model.createProfile,
                        )
                      : Button(
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
          ),
        );
      },
    );
  }
}
