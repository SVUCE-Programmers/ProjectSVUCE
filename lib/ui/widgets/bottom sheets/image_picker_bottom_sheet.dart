import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:svuce_app/ui/screens/admin%20screens/create%20post/create_post_view_model.dart';

bottomSheet(CreatePostViewModel model, BuildContext context, uiHelpers) {
  showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      backgroundColor: uiHelpers.backgroundColor,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ).copyWith(top: 10),
              child: Column(children: [
                ListTile(
                  onTap: () {
                    model.pickImage("camera");
                  },
                  title: Text("Pick From Camera", style: uiHelpers.title),
                  leading: Icon(FlutterIcons.camera_fea,
                      color: uiHelpers.textPrimaryColor),
                ),
                ListTile(
                  onTap: () {
                    model.pickImage("gallery");
                  },
                  title: Text("Pick From Gallery", style: uiHelpers.title),
                  leading: Icon(FlutterIcons.file_fea,
                      color: uiHelpers.textPrimaryColor),
                ),
                ListTile(
                  onTap: () {
                    model.pickImage("delete");
                  },
                  title: Text("Delete Image", style: uiHelpers.title),
                  leading: Icon(FlutterIcons.trash_2_fea, color: Colors.red),
                )
              ]),
            ),
          ));
}
