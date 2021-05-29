import 'package:flutter/material.dart';

import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';

import 'attendance_view_model.dart';

class AttendanceView extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<AttendanceViewModel>(
      viewModel: AttendanceViewModel(),
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

  addNewExelBottomSheet(BuildContext context, AttendanceViewModel model) {
    final TextEditingController _sheetNameController = TextEditingController();
    final TextEditingController _startingNoController = TextEditingController();
    final TextEditingController _totalCountController = TextEditingController();
    final TextEditingController _excludingNoController =
        TextEditingController();

    final UiHelpers uiHelpers = UiHelpers.fromContext(context);
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        context: context,
        builder: (context) => Container(
              height: uiHelpers.height * 0.7,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 25),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create New Sheet",
                      style: uiHelpers.title,
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Sheet Name",
                      style: uiHelpers.title.copyWith(fontSize: 12),
                    ),
                    TextFormField(
                      controller: _sheetNameController,
                      decoration: InputDecoration(
                        hintText: "Example CSE 3rd Year",
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12)),
                        fillColor: uiHelpers.surfaceColor,
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Starting Roll No",
                      style: uiHelpers.title.copyWith(fontSize: 12),
                    ),
                    Text(
                        "Suppose roll No starts with 11706601 then its is 1170600"),
                    TextFormField(
                      controller: _startingNoController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "1170600",
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12)),
                        fillColor: uiHelpers.surfaceColor,
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Enter Total Count",
                      style: uiHelpers.title.copyWith(fontSize: 12),
                    ),
                    TextFormField(
                      controller: _totalCountController,
                      decoration: InputDecoration(
                        hintText: "Example: 84",
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12)),
                        fillColor: uiHelpers.surfaceColor,
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Enter Excluding Roll No",
                      style: uiHelpers.title.copyWith(fontSize: 12),
                    ),
                    TextFormField(
                      controller: _excludingNoController,
                      decoration: InputDecoration(
                        hintText: "Ex:  32,52,90",
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
                            startingNo: _startingNoController.text,
                            totalCount: _totalCountController.text,
                            excludingNo:
                                _excludingNoController.text.split(",")),
                        color: uiHelpers.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)))
                  ],
                ),
              ),
            ));
  }

  bottomSheet(BuildContext context) {
    final UiHelpers uiHelpers = UiHelpers.fromContext(context);
    return Container(
      color: Colors.transparent,
      child: Container(
        height: 250,
        decoration: BoxDecoration(
            color: uiHelpers.surfaceColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.undo,
                color: uiHelpers.primaryColor,
              ),
              title: Text("Undo"),
            ),
            ListTile(
              leading: Icon(
                Icons.unfold_less,
                color: uiHelpers.primaryColor,
              ),
              title: Text("Reset"),
            )
          ],
        ),
      ),
    );
  }
}
