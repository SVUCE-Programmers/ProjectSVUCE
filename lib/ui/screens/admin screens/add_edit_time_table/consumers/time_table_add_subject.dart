import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';
import 'package:svuce_app/hive_db/models/time_table.dart';
import 'package:svuce_app/ui/screens/admin%20screens/add_edit_time_table/add_edit_time_table_view_model.dart';
import 'package:svuce_app/ui/screens/admin%20screens/add_edit_time_table/consumers/time_table_detail_widget_view_model.dart';
import 'package:svuce_app/ui/utils/button_animation.dart';
import 'package:svuce_app/ui/utils/text_field.dart';

class TimeTableWidget extends HookWidget {
  final AddEditTimeTableViewModel model;
  final TimeTable timeTable;
  final int timeTbaleIndex;

  TimeTableWidget(this.model, this.timeTable, this.timeTbaleIndex);
  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: 6);
    return ScreenBuilder<TimeTableDetailWidgetViewModel>(
        onModelReady: (m) => m.init(timeTable),
        viewModel: TimeTableDetailWidgetViewModel(),
        builder: (context, uiHelpers, model) {
          return Scaffold(
            body: Container(
              child: Column(
                children: [
                  TabBar(
                      labelStyle: uiHelpers.title,
                      unselectedLabelStyle: uiHelpers.body,
                      labelColor: uiHelpers.textPrimaryColor,
                      unselectedLabelColor: uiHelpers.textSecondaryColor,
                      physics: BouncingScrollPhysics(),
                      indicatorPadding: const EdgeInsets.only(right: 40),
                      labelPadding: EdgeInsets.symmetric(horizontal: 8),
                      indicatorSize: TabBarIndicatorSize.label,
                      isScrollable: true,
                      controller: tabController,
                      tabs: model.weekList
                          .map((e) => Tab(
                                text: e,
                              ))
                          .toList()),
                  Expanded(
                    child: TabBarView(
                        physics: BouncingScrollPhysics(),
                        controller: tabController,
                        children: model.weekList
                            .map((e) => Column(
                                  children: [
                                    ListTile(
                                      trailing: TextButton(
                                          onPressed: () => buildBottomSheet(
                                              uiHelpers, context, model,
                                              weekName: e),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text("Add Subject",
                                                textAlign: TextAlign.start,
                                                style: uiHelpers.button
                                                    .copyWith(
                                                        color: uiHelpers
                                                            .primaryColor)),
                                          )),
                                      leading: AnimatedOpacity(
                                        opacity: model.isShowUpdate ? 1 : 0,
                                        duration: Duration(milliseconds: 750),
                                        child: MaterialButton(
                                            color: uiHelpers.primaryColor,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Text(
                                              "Update",
                                              style: uiHelpers.button,
                                            ),
                                            onPressed: !model.isShowUpdate
                                                ? null
                                                : () => model.update()),
                                      ),
                                    ),
                                    Container(
                                        child: ListView.builder(
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) => AppBar(
                                        key: Key(index.toString()),
                                        actions: [
                                          IconButton(
                                              onPressed: () => buildBottomSheet(
                                                  uiHelpers, context, model,
                                                  weekName: e,
                                                  subject: model.timeTable
                                                      .tojson()[e]
                                                      .values
                                                      .elementAt(index),
                                                  time: model.timeTable
                                                      .tojson()[e]
                                                      .keys
                                                      .elementAt(index)),
                                              icon: Icon(
                                                Icons.edit,
                                                color: uiHelpers.primaryColor,
                                              )),
                                          IconButton(
                                              onPressed: () =>
                                                  model.deleteSubject(
                                                      model.timeTable
                                                          .tojson()[e]
                                                          .keys
                                                          .elementAt(index),
                                                      e),
                                              icon: Icon(
                                                FlutterIcons.trash_2_fea,
                                                color: uiHelpers.primaryColor,
                                              ))
                                        ],
                                        leadingWidth: uiHelpers.width * 0.25,
                                        elevation: 0,
                                        backgroundColor: Colors.transparent,
                                        leading: Container(
                                          alignment: Alignment.centerLeft,
                                          width: uiHelpers.width * 0.25,
                                          child: Text(
                                            model.timeTable
                                                .tojson()[e]
                                                .values
                                                .elementAt(index)
                                                .toString(),
                                            textAlign: TextAlign.start,
                                            style: uiHelpers.title,
                                          ),
                                        ),
                                        title: Text(
                                          model.timeTable
                                              .tojson()[e]
                                              .keys
                                              .elementAt(index)
                                              .toString(),
                                          style: uiHelpers.body,
                                        ),
                                      ),
                                      itemCount:
                                          model.timeTable.tojson()[e].length,
                                      primary: false,
                                    )),
                                  ],
                                ))
                            .toList()),
                  )
                ],
              ),
            ),
          );
        });
  }

  buildBottomSheet(UiHelpers uiHelpers, BuildContext context,
      TimeTableDetailWidgetViewModel model,
      {String time, String subject, @required String weekName}) {
    //?TODO ADD FOEM VSLIDATion
    final TextEditingController titleController = TextEditingController();
    final TextEditingController timeController = TextEditingController();
    if (subject != null) {
      titleController.text = subject;
      timeController.text = time;
    }

    showModalBottomSheet(
        backgroundColor: uiHelpers.backgroundColor,
        context: context,
        builder: (context) => Container(
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
                        onTap: subject != null
                            ? () => model.updateSubject(titleController.text,
                                weekName, timeController.text)
                            : () => model.addSubject(titleController.text,
                                timeController.text, weekName),
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
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))));
  }
}
