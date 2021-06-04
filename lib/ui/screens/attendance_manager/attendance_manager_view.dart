import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';
import 'package:svuce_app/ui/widgets/graphs/pie_chart.dart';
import 'attendance_manager_view_model.dart';
import 'widgets/attendance_item.dart';

class AttendanceManagerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<AttendanceManagerViewModel>(
      showLoadingOnBusy: false,
      onModelReady: (m) => m.getAttendance(),
      builder: (context, uiHelpers, model) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => addNewSubject(context, model),
          backgroundColor: uiHelpers.primaryColor,
          child: Icon(Icons.add),
        ),
        body: model.attendanceList.length == 0
            ? Column(
                children: [
                  Hero(
                    tag: "Attendance Hero",
                    child: Image.asset(
                      "assets/illustrations/attendance.png",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                        "Plan your bunks with this latest attendance feature",
                        style: uiHelpers.title,
                        textAlign: TextAlign.center),
                  ),
                  MaterialButton(
                      child: Text(
                        "Add Subject",
                        style: uiHelpers.title
                            .copyWith(color: uiHelpers.primaryColor),
                      ),
                      onPressed: () => addNewSubject(context, model)),
                ],
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    PieChartWidget(
                        totalClasses: model.totalClasses(),
                        totalPresentClasses: model.totalPresentClasses(),
                        chartData: model.generatePieChartData(),
                        attendanceList: model.attendanceList ?? []),
                    ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.all(20),
                      itemCount: model.attendanceList.length,
                      itemBuilder: (context, index) {
                        return AttendanceItem(index);
                      },
                    ),
                  ],
                ),
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
      ),
      viewModel: AttendanceManagerViewModel(),
    );
  }

  addNewSubject(BuildContext context, AttendanceManagerViewModel model) {
    final TextEditingController _subjectNameController =
        TextEditingController();
    Color color = model.randomColor();

    final UiHelpers uiHelpers = UiHelpers.fromContext(context);
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: uiHelpers.backgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        context: context,
        builder: (context) => StatefulBuilder(
              builder: (context, setState) => Container(
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
                          onPressed: () => model.addNewSubject(
                              _subjectNameController.text, color),
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
            ));
  }
}
