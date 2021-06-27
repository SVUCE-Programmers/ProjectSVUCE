import 'package:flutter/material.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';
import 'package:svuce_app/ui/screens/admin%20screens/attendance_staff_view/attendance_staff_view_model.dart';
import 'package:svuce_app/ui/utils/button_animation.dart';
import 'package:svuce_app/ui/utils/text_field.dart';

addNewExelBottomSheet(BuildContext context, AttendanceStaffViewModel model) {
  final TextEditingController _sheetNameController = TextEditingController();
  final TextEditingController _totalCountController = TextEditingController();
  final TextEditingController _excludingNoController = TextEditingController();

  final UiHelpers uiHelpers = UiHelpers.fromContext(context);
  showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: uiHelpers.backgroundColor,
      context: context,
      builder: (context) => Container(
            padding: const EdgeInsets.only(top: 25, right: 20, left: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Create New Sheet",
                    style: uiHelpers.title,
                  ),
                  SizedBox(height: 15),
                  AnimatedInputField(
                      title: "Sheet Name",
                      hintText: "Example CSE 3rd Year",
                      textEditingController: _sheetNameController),
                  AnimatedInputField(
                      title: "Total count",
                      hintText: "Example: 84",
                      textEditingController: _totalCountController),
                  AnimatedInputField(
                      title: "Excluding Roll No:",
                      hintText: "Example: 32,50,62",
                      textEditingController: _excludingNoController),
                  SizedBox(height: 10),
                  AnimatedButton(
                      title: Center(
                        child: Text(
                          "Add New Sheet",
                          style: uiHelpers.button,
                        ),
                      ),
                      onTap: () => model.addNewSheetForStaff(
                          sheetName: _sheetNameController.text,
                          totalCount: _totalCountController.text,
                          excludingNo: _excludingNoController.text.split(",")),
                      shapeBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  AnimatedPadding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      duration: Duration(milliseconds: 700),
                      child: uiHelpers.verticalSpaceLow),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
          ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))));
}
