import 'package:flutter/material.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/ui/screens/admin%20screens/add_students_view/add_student_view_model.dart';

class AddStudentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<AddStudentViewModel>(
      viewModel: AddStudentViewModel(),
      onModelReady: (m) => m.init(),
      builder: (context, uiHelpers, model) => Scaffold(),
    );
  }
}
