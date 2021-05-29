import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'attendance_staff_view_model.dart';

class ViewAttendance extends StatelessWidget {
  final String sheetName;
  final List<dynamic> data;
  const ViewAttendance({Key key, @required this.sheetName, @required this.data})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    generateTableMap() {
      Map<int, FixedColumnWidth> result = {};
      data.asMap().forEach((key, value) {
        result[key] = FixedColumnWidth((key == 0 || key == 1) ? 75 : 120);
      });
      return result;
    }

    return ScreenBuilder<AttendanceStaffViewModel>(
      builder: (context, uiHelpers, model) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                primary: false,
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Table(
                      columnWidths: generateTableMap(),
                      border:
                          TableBorder.all(color: uiHelpers.textPrimaryColor),
                      children: List.generate(
                          data.length,
                          (index) => TableRow(
                              children: List.generate(
                                  data[index].length,
                                  (subIdx) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "${data[index][subIdx]}",
                                          textAlign: TextAlign.center,
                                        ),
                                      ))))),
                ),
              )
            ],
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "$sheetName",
            style: uiHelpers.headline,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                onPressed: () => model.downloadExcelToDir(sheetName: sheetName),
                color: Colors.green,
                child: Row(
                  children: [
                    Icon(
                      FlutterIcons.share_2_fea,
                      color: Colors.white,
                      size: 15,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Share CSV",
                      style: uiHelpers.button.copyWith(fontSize: 14),
                    ),
                  ],
                ),
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
      ),
      viewModel: AttendanceStaffViewModel(),
    );
  }
}
