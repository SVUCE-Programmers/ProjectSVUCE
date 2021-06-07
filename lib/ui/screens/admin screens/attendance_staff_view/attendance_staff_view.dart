import 'package:flutter/material.dart';

import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';
import 'package:svuce_app/ui/utils/text_field.dart';

import 'attendance_staff_view_model.dart';

class AttendanceStaffView extends StatelessWidget {
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
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: uiHelpers.width * 0.1),
                    child: Text(
                        "Click On add Button to create a new sheet to add attendance",
                        style: uiHelpers.title,
                        textAlign: TextAlign.center),
                  )
                ],
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

  addNewExelBottomSheet(BuildContext context, AttendanceStaffViewModel model) {
    final TextEditingController _sheetNameController = TextEditingController();
    final TextEditingController _totalCountController = TextEditingController();
    final TextEditingController _excludingNoController =
        TextEditingController();

    final UiHelpers uiHelpers = UiHelpers.fromContext(context);
    showModalBottomSheet(
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
                    Text(
                      "Enter Excluding Roll No",
                      style: uiHelpers.title.copyWith(fontSize: 12),
                    ),
                    SizedBox(height: 5),
                    TextFormField(
                      controller: _excludingNoController,
                      decoration: InputDecoration(
                        hintText: "Ex:  32,52,90",
                        hintStyle: uiHelpers.body,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12)),
                        fillColor: uiHelpers.surfaceColor,
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 20),
                    MaterialButton(
                        child: Center(
                          child: Text(
                            "Add New Sheet",
                            style: uiHelpers.button,
                          ),
                        ),
                        onPressed: () => model.addNewSheetForStaff(
                            sheetName: _sheetNameController.text,
                            totalCount: _totalCountController.text,
                            excludingNo:
                                _excludingNoController.text.split(",")),
                        color: uiHelpers.primaryColor,
                        shape: RoundedRectangleBorder(
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
}
