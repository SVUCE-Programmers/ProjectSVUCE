import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/ui/utils/ui_helpers.dart';
import 'package:svuce_app/ui/views/announcements/announcement_view_model.dart';
import 'package:svuce_app/ui/widgets/announcement_item.dart';

class Announcements extends StatefulWidget {
  @override
  _AnnouncementsState createState() => _AnnouncementsState();
}

class _AnnouncementsState extends State<Announcements>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<AnnouncementViewModel>(
        viewModel: AnnouncementViewModel(),
        onModelReady: (model) => model.getData(),
        builder: (context, uiHelpers, model) => Scaffold(
              body: Column(
                children: <Widget>[
                  Container(
                    height: 100,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: surfaceColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30))),
                          height: 75,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: primaryColor),
                            child: TabBar(
                                indicatorSize: TabBarIndicatorSize.label,
                                isScrollable: true,
                                controller: _tabController,
                                tabs: [
                                  Tab(
                                    text: "All",
                                  ),
                                  Tab(
                                    text: "Exams",
                                  ),
                                  Tab(
                                    text: "Placements",
                                  ),
                                  Tab(
                                    text: "General",
                                  )
                                ]),
                            width: MediaQuery.of(context).size.width - 40,
                            padding: EdgeInsets.only(left: 10, right: 10),
                            height: 50,
                          ),
                        ),
                        Positioned(
                            top: 5,
                            left: 10,
                            child: IconButton(
                              icon: Icon(Icons.arrow_back, color: Colors.white),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )),
                        Positioned(
                            top: 15,
                            left: 0,
                            right: 0,
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Annoucemnets",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: "Quicksand",
                                      color: Colors.white,
                                      decoration: TextDecoration.none),
                                ))),
                      ],
                    ),
                  ),
                  Expanded(
                      child: TabBarView(controller: _tabController, children: [
                    all(model, "all", uiHelpers),
                    all(model, "Exam", uiHelpers),
                    all(model, "Placements", uiHelpers),
                    all(model, "General", uiHelpers),
                  ]))
                ],
              ),
            ));
  }

  all(AnnouncementViewModel model, String type, UIHelpers uiHelpers) {
    return Container(
      child: model.items != null
          ? ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: model.items.length,
              padding: EdgeInsets.all(20),
              itemBuilder: (context, index) => Container(
                child: model.items == null
                    ? CircularProgressIndicator()
                    : GestureDetector(
                        child: AnnounceItem(
                            uiHelpers: uiHelpers,
                            announce: model.items[index],
                            type: type),
                      ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation(Theme.of(context).primaryColor),
              ),
            ),
    );
  }
}
