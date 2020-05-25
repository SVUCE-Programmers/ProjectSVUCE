import 'package:flutter/material.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/models/annnouncement.dart';
import 'package:svuce_app/ui/utils/ui_helpers.dart';

class AnnounceItem extends StatelessWidget {
  final Announcement announce;
  final String type;
  final UIHelpers uiHelpers;

  const AnnounceItem({Key key, this.announce, this.type, this.uiHelpers})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("Type is" + type);
    int choice;
    var color = [Colors.orange, Colors.blue, Colors.red];
    switch (announce.type) {
      case "Exam":
        choice = 0;
        break;
      case "Placements":
        choice = 1;
        break;
      case "General":
        choice = 2;
        break;
      default:
    }

    return type == "all"
        ? Container(
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: color[choice],
                  ),
                  child: Text(
                    announce.type,
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w200),
                  ),
                ),
                uiHelpers.verticalSpaceLow,
                Text(announce.desc,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Quicksand",
                      fontWeight: FontWeight.w300,
                    )),
                uiHelpers.verticalSpaceLow,
                Text(
                  "",
                  style: TextStyle(fontWeight: FontWeight.w200, fontSize: 10),
                ),
              ],
            ),
          )
        : announce.type == type
            ? Container(
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: color[choice],
                      ),
                      child: Text(
                        announce.type,
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w200),
                      ),
                    ),
                    uiHelpers.verticalSpaceLow,
                    Text(announce.desc,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.w300,
                        )),
                    uiHelpers.verticalSpaceLow,
                    Text(
                      "",
                      style:
                          TextStyle(fontWeight: FontWeight.w200, fontSize: 10),
                    ),
                  ],
                ),
              )
            : SizedBox();
  }
}
