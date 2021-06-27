import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';
import 'package:svuce_app/ui/screens/admin%20screens/add_edit_time_table/consumers/time_table_detail_widget_view_model.dart';
import 'package:svuce_app/ui/utils/button_animation.dart';
import 'package:svuce_app/ui/utils/text_field.dart';

buildBottomSheet(UiHelpers uiHelpers, BuildContext context,
    TimeTableDetailWidgetViewModel model,
    {String time, String subject, @required String weekName}) {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  if (subject != null) {
    titleController.text = subject;
    timeController.text = time;
  }

  showModalBottomSheet(
      backgroundColor: uiHelpers.backgroundColor,
      context: context,
      builder: (context) => Form(
            key: formKey,
            child: Container(
              padding: const EdgeInsets.only(top: 25, right: 20, left: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text("Add Subject", style: uiHelpers.headline),
                    uiHelpers.verticalSpaceLow,
                    AnimatedInputField(
                        title: "Subject",
                        textEditingController: titleController),
                    AnimatedInputField(
                        onTap: () async {
                          var initialTime = await showTimePicker(
                              confirmText: "Start Time",
                              context: context,
                              initialTime: TimeOfDay.now());
                          if (initialTime != null) {
                            var finalTime = await showTimePicker(
                                confirmText: "End Time",
                                context: context,
                                initialTime: TimeOfDay.now());
                            if (finalTime != null) {
                              timeController.text =
                                  "${initialTime.hourOfPeriod}:${initialTime.minute} ${initialTime.period == DayPeriod.pm ? "PM" : "AM"} - ${finalTime.hourOfPeriod}:${finalTime.minute} ${initialTime.period == DayPeriod.pm ? "PM" : "AM"}";
                            }
                          }
                        },
                        enabled: false,
                        title: "Time",
                        textEditingController: timeController),
                    AnimatedButton(
                        leading: Icon(
                            subject != null
                                ? FlutterIcons.update_mco
                                : Icons.add,
                            color: Colors.white),
                        onTap: () {
                          if (formKey.currentState.validate()) {
                            subject != null
                                ? model.updateSubject(titleController.text,
                                    weekName, timeController.text)
                                : model.addSubject(titleController.text,
                                    timeController.text, weekName);
                          }
                        },
                        title: Text(
                            "${subject != null ? "Update" : "Add"} Subject",
                            style: uiHelpers.button)),
                    AnimatedPadding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        duration: Duration(milliseconds: 700),
                        child: uiHelpers.verticalSpaceHigh),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
            ),
          ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))));
}
