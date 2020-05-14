import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/models/event.dart';

class EventDetailsView extends StatelessWidget {
  final Event event;

  const EventDetailsView({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 250,
                        child: Image.network(
                          event.imageUrl,
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      Positioned(
                          top: 20,
                          left: 10,
                          child: InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: surfaceColor),
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                            ),
                          )),
                      Positioned(
                          top: 20,
                          right: 10,
                          child: InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: surfaceColor),
                              child: PopupMenuButton(
                                color: surfaceColor,
                                itemBuilder: (BuildContext context) =>
                                    <PopupMenuEntry<String>>[
                                  const PopupMenuItem<String>(
                                      child: ListTile(
                                    leading: Icon(
                                      Icons.share,
                                      color: Colors.white,
                                    ),
                                    title: Text(
                                      "Share",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )),
                                  const PopupMenuItem<String>(
                                      child: ListTile(
                                    leading: Icon(
                                      Icons.report,
                                      color: Colors.white,
                                    ),
                                    title: Text(
                                      "Report",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ))
                                ],
                                icon: Icon(
                                  Icons.more_vert,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 10),
                    child: Text(
                      event.eventName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: textPrimaryColor),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 10),
                    child: Text(
                      event.description,
                      style: TextStyle(color: textSecondaryColor, fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Container(
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(15)),
                  height: 50,
                  child: FlatButton(
                      onPressed: () {
                        // final Event event=Event(title: data["name"],
                        // startDate: DateTime.fromMillisecondsSinceEpoch(int.parse(data["timestamp"])),
                        // endDate: DateTime.fromMillisecondsSinceEpoch(int.parse(data["timestamp"])));
                        // Add2Calendar.addEvent2Cal(event);
                      },
                      child: Text(
                        "Add to Calendar",
                        style: TextStyle(
                            color: textPrimaryColor,
                            fontSize: 20,
                            fontFamily: "Quicksand",
                            fontWeight: FontWeight.w400),
                      )),
                )),
          ],
        ),
      ),
    );
  }
}
