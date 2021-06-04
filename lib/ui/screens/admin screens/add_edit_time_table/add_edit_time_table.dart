import 'package:flutter/material.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/ui/widgets/expansion_list_modified.dart';
import 'add_edit_time_table_view_model.dart';

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
                    children:[
                      
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
