import 'package:flutter/material.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/ui/screens/admin%20screens/add_edit_time_table/consumers/time_table_add_subject.dart';
import 'package:svuce_app/ui/widgets/expansion_list_modified.dart';
import 'add_edit_time_table_view_model.dart';
import '../../../widgets/bottom sheets/add_new_class.dart';

class AddEditTimeTableView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<AddEditTimeTableViewModel>(
      onModelReady: (m) => m.getTimeTableStream(),
      viewModel: AddEditTimeTableViewModel(),
      builder: (context, uiHelpers, model) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                itemBuilder: (context, index) => ExpansionTileModified(
                    trailingColor: uiHelpers.textPrimaryColor,
                    expandedAlignment: Alignment.centerLeft,
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 8),
                        child: Container(
                          child: TimeTableWidget(
                              model, model.timeTableList[index], index),
                          height: uiHelpers.height * 0.7,
                        ),
                      ),
                    ],
                    title: Text(model.timeTableList[index].id,
                        style: uiHelpers.title)),
                itemCount: model.timeTableList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                primary: false,
              )
            ],
          ),
        ),
        appBar: AppBar(
          actions: [
            PopupMenuButton(
                onSelected: (value) {
                  switch (value) {
                    case "Add":
                    showAddNewClass(uiHelpers,model,context);
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
