import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';
import 'package:svuce_app/ui/screens/admin%20screens/add_students_view/add_student_view_model.dart';

class AddUserWidget extends StatelessWidget {
  final AddStudentViewModel model;

  const AddUserWidget({Key key, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final UiHelpers uiHelpers = UiHelpers.fromContext(context);
    return SingleChildScrollView(
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              uiHelpers.verticalSpaceLow,
              model.excelFile != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: MaterialBanner(
                          content: Text(
                            "${model.excelFile.path.split("/").last}",
                            style: uiHelpers.title,
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          actions: [
                            IconButton(
                                onPressed: () => model.removeFile(),
                                icon: Icon(FlutterIcons.x_fea))
                          ]),
                    )
                  : Column(
                      children: [
                        ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                          tileColor: uiHelpers.surfaceColor,
                          title: Text("Download Excel", style: uiHelpers.title),
                          subtitle: Text("Download sample and use it.",
                              style: uiHelpers.body),
                          trailing: TextButton(
                              onPressed: model.downloadSample,
                              child: Text("Download",
                                  style: uiHelpers.button.copyWith(
                                      color: uiHelpers.primaryColor))),
                        ),
                        SizedBox(height: 20),
                        DottedBorder(
                          color: uiHelpers.primaryColor,
                          dashPattern: [8, 8],
                          radius: Radius.circular(8),
                          borderType: BorderType.RRect,
                          child: InkWell(
                            onTap: () => model.pickExcel(),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: uiHelpers.surfaceColor,
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.drive_folder_upload),
                                    SizedBox(width: 10),
                                    Text(
                                      "Please Upload Excel Sheet",
                                      style: uiHelpers.title.copyWith(
                                          color: uiHelpers.primaryColor),
                                    ),
                                  ],
                                ),
                              ),
                              height: 75,
                            ),
                          ),
                        ),
                      ],
                    ),
              uiHelpers.verticalSpaceLow,
              model.data != null && model.data.length != 0
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SingleChildScrollView(
                          primary: false,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Table(
                            columnWidths: {
                              0: FixedColumnWidth(150),
                              1: FixedColumnWidth(100),
                              2: FixedColumnWidth(80),
                              3: FixedColumnWidth(240),
                              4: FixedColumnWidth(120)
                            },
                            border: TableBorder.all(
                                color: uiHelpers.textSecondaryColor),
                            children: [
                              TableRow(
                                  children: [
                                "Name",
                                "Roll No",
                                "Gender",
                                "Email",
                                "Phone Number"
                              ]
                                      .map((e) => Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              e,
                                              style: uiHelpers.title,
                                            ),
                                          ))
                                      .toList()),
                              ...model.data.map((e) => TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        e.name,
                                        style: uiHelpers.body,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        e.rollNo.toString(),
                                        style: uiHelpers.body,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        e.gender,
                                        style: uiHelpers.body,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        e.email,
                                        style: uiHelpers.body,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        e.phoneNumber.toString(),
                                        style: uiHelpers.body,
                                      ),
                                    ),
                                  ]))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        CheckboxListTile(
                            activeColor: uiHelpers.primaryColor,
                            tileColor: uiHelpers.surfaceColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            title: Text(
                              "Is it students data?",
                              style: uiHelpers.title,
                            ),
                            subtitle: Text(
                              "If students,select it or uncheck the value",
                              style: uiHelpers.body,
                            ),
                            value: model.isStudentsData,
                            onChanged: (v) => model.changeType()),
                        SizedBox(
                          height: 15,
                        ),
                        MaterialButton(
                          color: uiHelpers.primaryColor,
                          onPressed: () => model.saveUserData(
                              isStudent: model.isStudentsData),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 30),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            "Add Data",
                            style: uiHelpers.button,
                          ),
                        )
                      ],
                    )
                  : SizedBox(),
            ],
          )),
    );
  }
}
