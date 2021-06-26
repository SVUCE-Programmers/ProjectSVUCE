import 'package:flutter/material.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';
import 'package:svuce_app/ui/utils/animatedText.dart';
import 'package:svuce_app/ui/utils/animated_drop_down.dart';
import 'package:svuce_app/ui/utils/button_animation.dart';
import 'package:svuce_app/ui/utils/text_field.dart';

import '../add_edit_time_table_view_model.dart';

Future showAddNewClass(UiHelpers uiHelpers, AddEditTimeTableViewModel model,
    BuildContext context) async {
  final TextEditingController branchController = TextEditingController();
  final TextEditingController yearController = TextEditingController();

  showModalBottomSheet(
      backgroundColor: uiHelpers.backgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      isScrollControlled: true,
      context: context,
      builder: (context) => SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedText(
                    data: "Add New Class",
                    style: uiHelpers.headline,
                  ),
                  AnimatedDropdown(
                      items: [
                        "CSE",
                        "ECE",
                        "MECH",
                        "EEE",
                        "CIV",
                        "CHE",
                      ],
                      title: "Class Name",
                      textEditingController: branchController),
                  AnimatedInputField(
                      title: "Year", textEditingController: yearController),
                  AnimatedButton(
                    onTap: () {},
                    title: Text("Add New Class"),
                  ),
                  AnimatedPadding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      duration: Duration(milliseconds: 500))
                ],
              ),
            ),
          ));
}
