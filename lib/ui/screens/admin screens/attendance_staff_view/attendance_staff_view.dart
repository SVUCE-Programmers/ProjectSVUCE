import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/ui/widgets/bottom%20sheets/attendance_add.dart';

import 'attendance_staff_view_model.dart';

class AttendanceStaffView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<AttendanceStaffViewModel>(
      viewModel: AttendanceStaffViewModel(),
      onModelReady: (model) => model.init(),
      disposeViewModel: false,
      builder: (context, uiHelpers, model) => Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: uiHelpers.primaryColor,
          onPressed: () => addNewExelBottomSheet(context, model),
          child: Icon(Icons.add),
          tooltip: "Add Sheet",
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              icon: Icon(
                backIcon,
                color: uiHelpers.textPrimaryColor,
              ),
              onPressed: model.navigateBack),
          title: Text(
            "Attendance Manager",
            style:
                uiHelpers.headline.copyWith(color: uiHelpers.textPrimaryColor),
          ),
        ),
        body: (!model.isExcelCreated ||
                (model.excelSheets != null && model.excelSheets.length == 0))
            ? SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    uiHelpers.verticalSpaceHigh,
                    Hero(
                        tag: 'Attendance Hero',
                        child:
                            Image.asset("assets/illustrations/attendance.png")),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: uiHelpers.width * 0.1),
                      child: Text(
                          "Click On add Button to create a new sheet to add attendance",
                          style: uiHelpers.title,
                          textAlign: TextAlign.center),
                    ),
                    uiHelpers.verticalSpaceHigh,
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        itemBuilder: (_, index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            dense: true,
                            onTap: () =>
                                model.getSheetData(model.excelSheets[index]),
                            trailing: PopupMenuButton(
                              color: uiHelpers.surfaceColor,
                              icon: Icon(
                                Icons.more_vert,
                                color: uiHelpers.textPrimaryColor,
                              ),
                              onSelected: (value) {
                                switch (value) {
                                  case "vd":
                                    model.viewDetails(model.excelSheets[index]);
                                    break;
                                  case "ta":
                                    model
                                        .getSheetData(model.excelSheets[index]);
                                    break;
                                  case "delete":
                                    model.deleteSheet(
                                        sheetName: model.excelSheets[index]);
                                    break;
                                  default:
                                }
                              },
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                    value: "vd",
                                    child: Text(
                                      "View Details",
                                      style: uiHelpers.title
                                          .copyWith(fontSize: 14),
                                    )),
                                PopupMenuItem(
                                    value: "ta",
                                    child: Text(
                                      "Take Attendance",
                                      style: uiHelpers.title
                                          .copyWith(fontSize: 14),
                                    )),
                                PopupMenuItem(
                                    value: "delete",
                                    child: Text(
                                      "Delete",
                                      style: uiHelpers.title
                                          .copyWith(fontSize: 14),
                                    ))
                              ],
                            ),
                            tileColor: uiHelpers.surfaceColor,
                            title: Row(
                              children: [
                                Text(
                                  model.excelSheets[index],
                                  style: uiHelpers.title,
                                ),
                              ],
                            ),
                          ),
                        ),
                        itemCount: model.excelSheets.length,
                        primary: false,
                        shrinkWrap: true,
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
