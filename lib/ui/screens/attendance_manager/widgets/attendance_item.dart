import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked/stacked.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';

import './../attendance_manager_view_model.dart';

class AttendanceItem extends ViewModelWidget<AttendanceManagerViewModel> {
  final int index;

  AttendanceItem(this.index);

  @override
  Widget build(BuildContext context, AttendanceManagerViewModel model) {
    var attendance = model.attendanceList[index];
    final UiHelpers uiHelpers = UiHelpers.fromContext(context);

    return AnimatedContainer(
      duration: Duration(milliseconds: 900),
      decoration: BoxDecoration(
        border: Border(
            left: BorderSide(
                color: attendance.total == 0
                    ? Colors.greenAccent
                    : (attendance.present / attendance.total) >= 0.75
                        ? Colors.green
                        : Colors.red,
                width: 5.0,
                style: BorderStyle.solid)),
        color: uiHelpers.surfaceColor,
      ),
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text.rich(TextSpan(children: [
                TextSpan(
                  text: attendance.subject,
                  style: uiHelpers.title,
                ),
                TextSpan(text: "\n"),
                TextSpan(
                  text: model.getStatus(attendance.present, attendance.total),
                  style: uiHelpers.body,
                ),
              ])),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: attendance.present.toString()),
                    TextSpan(text: "/"),
                    TextSpan(text: attendance.total.toString()),
                  ],
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
        subtitle: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => model.addPresent(index),
            ),
            IconButton(
              icon: Icon(FlutterIcons.minus_fea),
              onPressed: () => model.addAbsent(index),
            ),
            Spacer(),
            PopupMenuButton(
              onSelected: (value) {
                switch (value) {
                  case "Delete":
                    model.deleteSubject(attendance);
                    break;
                  case "Undo":
                    model.undoAttendance(attendance, index);
                    break;
                  case "Modify":
                    TextEditingController presentController =
                        TextEditingController();

                    TextEditingController absentController =
                        TextEditingController();

                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              backgroundColor: uiHelpers.surfaceColor,
                              title: Text(
                                "Modify Data",
                                style: uiHelpers.title,
                              ),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Present",
                                      style: uiHelpers.title
                                          .copyWith(fontSize: 12),
                                    ),
                                    SizedBox(height: 5),
                                    TextFormField(
                                      controller: presentController,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        hintText: "Enter present",
                                        hintStyle: uiHelpers.body,
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        fillColor: uiHelpers.backgroundColor,
                                        filled: true,
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      "Absent",
                                      style: uiHelpers.title
                                          .copyWith(fontSize: 12),
                                    ),
                                    SizedBox(height: 5),
                                    TextFormField(
                                      controller: absentController,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        hintText: "Enter absent classes",
                                        hintStyle: uiHelpers.body,
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        fillColor: uiHelpers.backgroundColor,
                                        filled: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                MaterialButton(
                                    onPressed: () => model.modifyAttendance(
                                        attendance,
                                        int.parse(absentController.text) +
                                            int.parse(presentController.text),
                                        int.parse(absentController.text),
                                        int.parse(presentController.text),
                                        index),
                                    child: Text(
                                      "Confirm",
                                      style: uiHelpers.title,
                                    ))
                              ],
                            ));
                    break;
                  default:
                }
              },
              color: uiHelpers.backgroundColor,
              tooltip: "More",
              itemBuilder: (context) => [
                PopupMenuItem(
                    enabled: (attendance.lastUpdated.length > 1 &&
                        attendance.lastUpdated.last != "Nothing"),
                    value: "Undo",
                    child: ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text(
                        "Undo",
                        style: uiHelpers.title.copyWith(fontSize: 14),
                      ),
                      horizontalTitleGap: 4,
                      trailing: Icon(
                        Icons.undo,
                        color: uiHelpers.textPrimaryColor,
                        size: 15,
                      ),
                    )),
                PopupMenuItem(
                    value: "Modify",
                    child: ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text(
                        "Modify",
                        style: uiHelpers.title.copyWith(fontSize: 14),
                      ),
                      horizontalTitleGap: 4,
                      trailing: Icon(
                        FlutterIcons.mode_edit_mdi,
                        color: uiHelpers.textPrimaryColor,
                        size: 15,
                      ),
                    )),
                PopupMenuItem(
                    value: "Delete",
                    child: ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text(
                        "Delete",
                        style: uiHelpers.title.copyWith(fontSize: 14),
                      ),
                      horizontalTitleGap: 4,
                      trailing: Icon(
                        FlutterIcons.trash_2_fea,
                        color: uiHelpers.textPrimaryColor,
                        size: 15,
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
