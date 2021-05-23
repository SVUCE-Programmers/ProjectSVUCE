import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/ui/screens/admin%20screens/add_students_view/add_student_view_model.dart';

class AddStudentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<AddStudentViewModel>(
      viewModel: AddStudentViewModel(),
      onModelReady: (m) => m.init(),
      builder: (context, uiHelpers, model) => Scaffold(
        body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  uiHelpers.verticalSpaceLow,
                  DottedBorder(
                    dashPattern: [8, 8],
                    radius: Radius.circular(8),
                    borderType: BorderType.RRect,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: uiHelpers.surfaceColor,
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.drive_folder_upload),
                              SizedBox(width: 10),
                              Text(
                                "Please Upload Excel Sheet",
                                style: uiHelpers.title
                                    .copyWith(color: uiHelpers.primaryColor),
                              ),
                            ],
                          ),
                        ),
                        height: 75,
                      ),
                    ),
                  )
                ],
              )),
        ),
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
                icon: Icon(
                  backIcon,
                  color: uiHelpers.textPrimaryColor,
                ),
                onPressed: model.navigateBack)),
      ),
    );
  }
}
