import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';
import 'package:svuce_app/hive_db/models/staff_model.dart';
import 'package:svuce_app/ui/screens/staff/consumers/staff_details.dart';

class StaffWidget extends StatelessWidget {
  final StaffModel staffModel;
  const StaffWidget({
    Key key,
    @required this.staffModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiHelpers = UiHelpers.fromContext(context);
    return OpenContainer(
      transitionDuration: Duration(milliseconds: 700),
      closedColor: Colors.transparent,
      openColor: Colors.transparent,
      closedElevation: 0,
      openElevation: 0,
      openBuilder: (context, details) =>
          StaffDetailsView(staffModel: staffModel),
      closedBuilder: (context, details) => Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: uiHelpers.surfaceColor,
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(120),
              child: Image.asset(
                "assets/images/logo.png",
                color: uiHelpers.primaryColor,
                alignment: Alignment.bottomCenter,
                height: 80,
                width: uiHelpers.width * 0.2,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${staffModel.name}",
                    style: uiHelpers.title, textAlign: TextAlign.center),
                SizedBox(height: 5),
                Text("${staffModel.designation.join(',')}"),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "More Details",
                      style: uiHelpers.button
                          .copyWith(color: uiHelpers.primaryColor),
                    ))
              ],
            )),
          ],
        ),
      ),
    );
  }
}
