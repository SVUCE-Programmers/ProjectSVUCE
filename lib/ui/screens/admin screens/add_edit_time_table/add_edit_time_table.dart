import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/ui/screens/admin%20screens/add_edit_time_table/consumers/time_table_add_subject.dart';
import 'package:svuce_app/ui/widgets/bottom%20sheets/delete_class_sheet.dart';
import 'add_edit_time_table_view_model.dart';
import '../../../widgets/bottom sheets/add_new_class.dart';

class AddEditTimeTableView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<AddEditTimeTableViewModel>(
      onModelReady: (m) => m.getTimeTableStream(),
      viewModel: AddEditTimeTableViewModel(),
      builder: (context, uiHelpers, model) => Scaffold(
        body: DefaultTabController(
          length: model.timeTableList.length,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(
                  isScrollable: true,
                  labelColor: uiHelpers.textPrimaryColor,
                  unselectedLabelColor: uiHelpers.textSecondaryColor,
                  tabs:
                      model.timeTableList.map((e) => Tab(text: e.id)).toList()),
              Expanded(
                child: TabBarView(
                  children: model.timeTableList
                      .map((timeTable) => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 8),
                            child: Container(
                              child: TimeTableWidget(model, timeTable,
                                  model.timeTableList.indexOf(timeTable)),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          actions: [
            PopupMenuButton(
                onSelected: (value) {
                  switch (value) {
                    case "Add":
                      showAddNewClass(uiHelpers, model, context);
                      break;
                    case "Delete":
                      deleteClassSheet(uiHelpers, model, context);
                      break;
                    default:
                  }
                },
                icon: Icon(
                  Icons.more_vert,
                  color: uiHelpers.textPrimaryColor,
                ),
                color: uiHelpers.surfaceColor,
                itemBuilder: (_) => [
                      PopupMenuItem(
                          value: "Add",
                          child: Text(
                            "Add New Class",
                            style: uiHelpers.title,
                          )),
                      PopupMenuItem(
                          value: "Delete",
                          child: Text(
                            "Delete Class",
                            style: uiHelpers.title,
                          ))
                    ]),
          ],
          leading: Hero(
            tag: "backIcon",
            child: Material(
              color: Colors.transparent,
              child: IconButton(
                  icon: Icon(
                    backIcon,
                    color: uiHelpers.textPrimaryColor,
                  ),
                  onPressed: () => model.navigateBack()),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Edit Timetable",
            style:
                uiHelpers.headline.copyWith(color: uiHelpers.textPrimaryColor),
          ),
        ),
      ),
    );
  }
}
