import 'package:flutter/material.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';
import 'package:svuce_app/hive_db/models/staff_model.dart';

class StaffDetailsView extends StatelessWidget {
  final StaffModel staffModel;
  const StaffDetailsView({Key key, @required this.staffModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiHelpers uiHelpers = UiHelpers.fromContext(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(120),
                      child: FadeInImage(
                        fit: BoxFit.fitWidth,
                        placeholder: AssetImage('assets/images/logo.png'),
                        image: NetworkImage(staffModel.imgUrl),
                        imageErrorBuilder: (context, object, stack) =>
                            Image.asset('assets/images/logo.png'),
                      ),
                    ),
                    height: 175,
                    width: 175,
                    decoration: BoxDecoration(shape: BoxShape.circle)),
              ),
              SizedBox(
                height: 15,
              ),
              Text(staffModel.name, style: uiHelpers.title),
              Text(staffModel.email),
              SizedBox(
                height: 25,
              ),
              Card(
                color: uiHelpers.surfaceColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    ListTile(
                      dense: true,
                      minVerticalPadding: 0,
                      subtitle: Divider(
                        height: 0,
                      ),
                      title: Text("Details", style: uiHelpers.title),
                    ),
                    ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      trailing:
                          Text("${staffModel.phone}", style: uiHelpers.body),
                      title: Text("Phone Number",
                          style: uiHelpers.body.copyWith(
                              color: uiHelpers.textPrimaryColor,
                              fontWeight: FontWeight.bold)),
                    ),
                    ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      trailing: Text("${staffModel.designation.join(',')}",
                          style: uiHelpers.body),
                      title: Text("Designations",
                          style: uiHelpers.body.copyWith(
                              color: uiHelpers.textPrimaryColor,
                              fontWeight: FontWeight.bold)),
                    ),
                    ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      trailing: TextButton(
                        onPressed: () {},
                        child: Text("Click here",
                            style: uiHelpers.body
                                .copyWith(color: uiHelpers.primaryColor)),
                      ),
                      title: Text("More Details",
                          style: uiHelpers.body.copyWith(
                              color: uiHelpers.textPrimaryColor,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(staffModel.name + " Profile", style: uiHelpers.headline),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              backIcon,
              color: uiHelpers.textPrimaryColor,
            )),
      ),
    );
  }
}
