import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/core/models/feed/feed.dart';
import 'package:svuce_app/ui/screens/admin%20screens/create%20post/create_post_view_model.dart';
import 'package:svuce_app/ui/utils/button_animation.dart';
import 'package:svuce_app/ui/utils/text_field.dart';
import 'package:svuce_app/ui/widgets/animations/fade_transition.dart';
import 'package:svuce_app/ui/widgets/bottom%20sheets/image_picker_bottom_sheet.dart';

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
                  AnimatedInputField(
                      title: "Title",
                      textEditingController: model.titleController),
                  AnimatedInputField(
                      title: "Description",
                      maxLines: 4,
                      textEditingController: model.descController),
                  FadeAnimation(
                    delay: 0.8,
                    xDistance: 0,
                    yDistance: 30,
                    child: Text(
                      "Type",
                      style: uiHelpers.title.copyWith(fontSize: 14),
                    ),
                  ),
                  SizedBox(height: 5),
                  FadeAnimation(
                    delay: 0.8,
                    xDistance: 0,
                    yDistance: 30,
                    child: DropdownButtonFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please choose type";
                        }

                        return null;
                      },
                      value: model.type,
                      dropdownColor: uiHelpers.surfaceColor,
                      onChanged: model.changeType,
                      items: [
                        "Placement",
                        "Exams",
                        "General",
                        "Technology",
                        "Notes"
                      ]
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
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  AnimatedInputField(
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
                      title: "Url(optional)",
                      textEditingController: model.urlController),
                  FadeAnimation(
                    delay: 0.8,
                    xDistance: 0,
                    yDistance: 30,
                    child: GestureDetector(
                      onTap: () => bottomSheet(model, context, uiHelpers),
                      child: TextField(
                        enabled: false,
                        decoration: InputDecoration(
                            hintText: model.file != null
                                ? model.file.path.toString().split("/").last
                                : "Upload an Image(optional)",
                            hintStyle: uiHelpers.body,
                            isDense: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(12)),
                            filled: true,
                            fillColor: uiHelpers.surfaceColor,
                            prefixIconConstraints:
                                BoxConstraints(minHeight: 50, minWidth: 80),
                            prefixIcon: Container(
                              margin: const EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                  color: uiHelpers.primaryColor,
                                  borderRadius: BorderRadius.circular(12)),
                              child: model.file != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: FadeInImage(
                                          height: 50,
                                          width: 50,
                                          fit: BoxFit.fill,
                                          placeholder: AssetImage(
                                              "assets/images/logo.png"),
                                          image: FileImage(model.file)),
                                    )
                                  : Icon(FlutterIcons.upload_fea,
                                      color: Colors.white),
                            )),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  AnimatedButton(
                    onTap: () => model.handleFormValidation(),
                    title: Center(
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
