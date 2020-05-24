import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/ui/views/attendance_manager/attendance_view_model.dart';

class AttendanceView extends StatefulWidget {
  @override
  _AttendanceViewState createState() => _AttendanceViewState();
}

class _AttendanceViewState extends State<AttendanceView> {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<AttendanceViewModel>(
      viewModel: AttendanceViewModel(),
      onModelReady: (model) => model.init(),
      disposeViewModel: true,
      builder: (context, uiHelpers, model) => Scaffold(
        key: model.scaffoldKey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Attendance Manager",
            style: uiHelpers.headline.copyWith(color: textPrimaryColor),
          ),
        ),
        body: ListView.builder(
          itemCount: model.atList.length,
          itemBuilder: (context, int index) {
            return Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: surfaceColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 50,
                                width: 10,
                                decoration: BoxDecoration(
                                    color: model.atList[index].total == 0
                                        ? Colors.greenAccent
                                        : (model.atList[index].present /
                                                    model
                                                        .atList[index].total) >=
                                                0.75
                                            ? Colors.green
                                            : Colors.red,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              SizedBox(width: 10),
                              Text(
                                model.atList[index].subject,
                                style: TextStyle(color: textPrimaryColor),
                              )
                            ],
                          ),
                          RichText(
                            text: TextSpan(
                                text: "Attendance:",
                                style: TextStyle(color: textSecondaryColor),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: (model.atList[index].present
                                              .toString() +
                                          "/" +
                                          model.atList[index].total.toString()),
                                      style: TextStyle(color: textPrimaryColor))
                                ]),
                          ),
                          RichText(
                            text: TextSpan(
                                text: "Status:",
                                style: TextStyle(color: textPrimaryColor),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: (model
                                          .getStatus(
                                              model.atList[index].present,
                                              model.atList[index].total)
                                          .toString()),
                                      style: TextStyle(color: textPrimaryColor))
                                ]),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 40,
                                  backgroundColor: backgroundColor,
                                  child: Container(),
                                ),
                                SizedBox(height: 5.0),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: GestureDetector(
                                          onTap: () async {
                                            await model.addPresent(
                                                model.atList[index].subject,
                                                index);
                                          },
                                          child: Icon(addIcon,
                                              color: Colors.white, size: 15)),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: GestureDetector(
                                          onTap: () {
                                            model.addAbsent(
                                                model.atList[index].subject,
                                                index);
                                          },
                                          child: Icon(
                                            Icons.work,
                                            color: Colors.white,
                                            size: 15,
                                          )),
                                    )
                                  ],
                                )
                              ],
                            ),
                            IconButton(
                                icon: Icon(Icons.more_vert),
                                onPressed: () => model.scaffoldKey.currentState
                                    .showBottomSheet(
                                        (context) => bottomSheet(context)))
                          ],
                        ),
                      ),
                    )
                  ],
                ));
          },
        ),
      ),
    );
  }

  bottomSheet(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        height: 250,
        decoration: BoxDecoration(
            color: surfaceColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.undo,
                color: primaryColor,
              ),
              title: Text("Undo"),
            ),
            ListTile(
              leading: Icon(
                Icons.unfold_less,
                color: primaryColor,
              ),
              title: Text("Reset"),
            )
          ],
        ),
      ),
    );
  }
}
