import 'package:provider_architecture/provider_architecture.dart';
import 'package:flutter/material.dart';
import 'package:svuce_app/ui/shared/app_colors.dart';
import 'package:svuce_app/ui/shared/ui_helpers.dart';
import 'package:svuce_app/viewmodels/notifications_viewmodel.dart';

class NotificationsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<NotificationsViewModel>.withConsumer(
        viewModel: NotificationsViewModel(),
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text("Notifications"),
            centerTitle: true,
          ),
          body: Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                color: secondaryLight,
                borderRadius: BorderRadius.circular(15)
              ),
              padding: EdgeInsets.fromLTRB(20, 20, 15, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Announcement",style: TextStyle(fontSize: 12,color: primary),),
                  verticalSpaceLow,
                  Text("Lockdown Extended due to Covid-19"),
                  verticalSpaceMedium,
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: secondaryDark,
                    ),
                   
                    height: 40,
                    child: FlatButton(onPressed: (){}, child: Text("View Info",style: TextStyle(color: Colors.white),)),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
