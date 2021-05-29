import 'package:flutter/material.dart';
import 'package:svuce_app/app/default_view.dart';
import 'attendance_manager_view_model.dart';

class AttendanceManagerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<AttendanceManagerViewModel>(
      builder: (context, uiHelpers, model) => Scaffold(
        
      ),
      viewModel: AttendanceManagerViewModel(),
    );
  }
}
