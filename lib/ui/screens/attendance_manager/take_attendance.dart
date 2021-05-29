import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/core/utils/date_utils.dart';
import 'package:svuce_app/ui/screens/attendance_manager/attendance_view_model.dart';

class TakeAttendancePage extends HookWidget {
  final List<int> rollList;
  final String sheetName;

  const TakeAttendancePage({Key key, this.rollList, @required this.sheetName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final log = getLogger("Take Attendance View");
    final dateTime = useState(DateTime.now());
    return ScreenBuilder<AttendanceViewModel>(
      viewModel: AttendanceViewModel(),
      builder: (context, uiHelpers, model) => WillPopScope(
        onWillPop: () async {
          model.clearAttendance();
          return true;
        },
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: uiHelpers.primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            label: Text(
              "Save Attendance",
              style: uiHelpers.button,
            ),
            onPressed: () {
              List<String> temp = [];
              temp.add(DateTimeUtils()
                  .getWholeDate(dateTime.value.millisecondsSinceEpoch)
                  .toString());

              rollList.asMap().forEach((key, value) {
                temp.add(model.attendanceData[value] ?? "A");
              });
              model.updateAndSaveAttendance(sheetName, temp);
            },
            autofocus: true,
          ),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              "$sheetName",
              style: uiHelpers.headline,
            ),
            actions: [
              MaterialButton(
                onPressed: () => model.selectAll(sheetName),
                child: Text(
                  "Select All",
                  style: uiHelpers.headline.copyWith(fontSize: 14),
                ),
              )
            ],
            leading: IconButton(
                icon: Icon(
                  backIcon,
                  color: uiHelpers.textPrimaryColor,
                ),
                onPressed: () {
                  model.clearAttendance();
                  model.navigateBack();
                }),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    subtitle: Text(
                      "Click on icon to change date",
                      style: uiHelpers.body,
                    ),
                    trailing: IconButton(
                        icon: Icon(
                          eventsIcon,
                          color: uiHelpers.textPrimaryColor,
                        ),
                        onPressed: () async {
                          var data = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(DateTime.now().year - 4),
                              lastDate: DateTime(DateTime.now().year + 4));
                          if (data != null) {
                            dateTime.value = data;
                          }
                        }),
                    // tileColor: uiHelpers.surfaceColor,
                    title: Text(
                      "Selected Date is: " +
                          DateTimeUtils()
                              .getWholeDate(
                                  dateTime.value.millisecondsSinceEpoch)
                              .toString(),
                      style: uiHelpers.title,
                    ),
                  ),
                  ListView.builder(
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CheckboxListTile(
                        activeColor: uiHelpers.primaryColor,
                        tileColor: uiHelpers.surfaceColor,
                        value: model.attendanceData[rollList[index]] == "P",
                        onChanged: (value) {
                          model.updateAttendance(rollList[index], value);
                        },
                        title: Text(
                          "Roll No: ${rollList[index]}",
                          style: uiHelpers.title,
                        ),
                      ),
                    ),
                    primary: false,
                    shrinkWrap: true,
                    itemCount: rollList.length,
                  ),
                  uiHelpers.verticalSpaceMedium
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
