import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';
import 'package:svuce_app/ui/screens/attendance_manager/attendance_manager_view_model.dart';

addNewSubject(BuildContext context, AttendanceManagerViewModel model) {
  final TextEditingController _subjectNameController = TextEditingController();
  Color color = model.randomColor();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final UiHelpers uiHelpers = UiHelpers.fromContext(context);
  showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: uiHelpers.backgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      context: context,
      builder: (context) => StatefulBuilder(
            builder: (context, setState) => Form(
              key: formKey,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20)
                    .copyWith(top: 25),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create New Subject",
                        style: uiHelpers.title,
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Subject Name",
                        style: uiHelpers.title.copyWith(fontSize: 12),
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        controller: _subjectNameController,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: "Example Java",
                          hintStyle: uiHelpers.body,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(12)),
                          fillColor: uiHelpers.surfaceColor,
                          filled: true,
                        ),
                      ),
                      SizedBox(height: 15),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: ListTile(
                          trailing: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: color,
                                shape: BoxShape.circle,
                              )),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text(
                                        "Choose your color",
                                        style: uiHelpers.title,
                                      ),
                                      actions: [
                                        MaterialButton(
                                            onPressed: () {
                                              model.navigateBack();
                                            },
                                            child: Text("Confirm",
                                                style: uiHelpers.title))
                                      ],
                                      backgroundColor:
                                          uiHelpers.backgroundColor,
                                      content: SingleChildScrollView(
                                        child: MaterialPicker(
                                          enableLabel: true,
                                          pickerColor: uiHelpers.primaryColor,
                                          onColorChanged: (value) {
                                            setState(() {
                                              color = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ));
                          },
                          tileColor: uiHelpers.surfaceColor,
                          subtitle: Text(
                            "Click on color button to change color",
                            style: uiHelpers.body.copyWith(fontSize: 14),
                          ),
                          title: Text(
                            "Pick some color",
                            style: uiHelpers.title,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      MaterialButton(
                          onPressed: formKey.currentState.validate()
                              ? () => model.addNewSubject(
                                  _subjectNameController.text, color)
                              : () {},
                          child: Center(
                            child: Text(
                              "Add New Subject",
                              style: uiHelpers.button,
                            ),
                          ),
                          color: uiHelpers.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      AnimatedPadding(
                        duration: Duration(milliseconds: 700),
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: uiHelpers.verticalSpaceMedium,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ));
}
