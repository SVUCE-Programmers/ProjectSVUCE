import 'package:flutter/material.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/core/models/feed/feed.dart';
import 'package:svuce_app/ui/screens/admin%20screens/create%20post/create_post_view_model.dart';

class CreatePost extends StatelessWidget {
  final Feed feed;

  const CreatePost({Key key, this.feed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<CreatePostViewModel>(
      viewModel: CreatePostViewModel(),
      onModelReady: (m) => m.init(temp: feed),
      builder: (context, uiHelpers, model) => Scaffold(
        body: Form(
          key: model.formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Title",
                    style: uiHelpers.title.copyWith(fontSize: 14),
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    controller: model.titleController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please enter title";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                        fillColor: uiHelpers.surfaceColor,
                        filled: true,
                        hintText: "Enter title....",
                        hintStyle: uiHelpers.body,
                        isDense: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12),
                        )),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Description",
                    style: uiHelpers.title.copyWith(fontSize: 14),
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    controller: model.descController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please enter description";
                      } else if (value.length < 8) {
                        return "Description shouldn't be short";
                      }

                      return null;
                    },
                    maxLines: 4,
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        fillColor: uiHelpers.surfaceColor,
                        filled: true,
                        hintText: "Enter Description....",
                        hintStyle: uiHelpers.body,
                        isDense: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12),
                        )),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Type",
                    style: uiHelpers.title.copyWith(fontSize: 14),
                  ),
                  SizedBox(height: 5),
                  DropdownButtonFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please choose type";
                      }

                      return null;
                    },
                    value: model.type,
                    dropdownColor: uiHelpers.surfaceColor,
                    onChanged: model.changeType,
                    items:
                        ["Placement", "Exams", "General", "Technology", "Notes"]
                            .map((e) => DropdownMenuItem(
                                  child: Text(e),
                                  value: e,
                                ))
                            .toList(),
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        fillColor: uiHelpers.surfaceColor,
                        filled: true,
                        hintText: "Enter Type....",
                        hintStyle: uiHelpers.body,
                        isDense: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12),
                        )),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Url (optional)",
                    style: uiHelpers.title.copyWith(fontSize: 14),
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    controller: model.urlController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return null;
                      } else {
                        RegExp regExp = new RegExp(
                          r"https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)",
                        );
                        if (!regExp.hasMatch(value)) {
                          return "Please enter a valid url";
                        }
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                        fillColor: uiHelpers.surfaceColor,
                        filled: true,
                        hintText: "Enter url....",
                        hintStyle: uiHelpers.body,
                        isDense: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: uiHelpers.primaryColor,
                    onPressed: () => model.handleFormValidation(),
                    child: Center(
                        child: Text(
                      "${feed != null ? "Update" : "Create"} Post",
                      style: uiHelpers.button,
                    )),
                  )
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              icon: Icon(
                backIcon,
                color: uiHelpers.textPrimaryColor,
              ),
              onPressed: model.goBack),
          title: Text(
            "${feed != null ? "Update" : "Create"} Post",
            style:
                uiHelpers.headline.copyWith(color: uiHelpers.textPrimaryColor),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
