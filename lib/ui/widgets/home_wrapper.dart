import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:svuce_app/models/home_view_item.dart';
import 'package:svuce_app/ui/shared/app_colors.dart';
import 'package:svuce_app/ui/shared/shared_styles.dart';
import 'package:svuce_app/ui/views/notifications_view.dart';

class HomeWrapper extends StatefulWidget {
  final Widget drawer;
  final List<HomeViewItem> homeViewItems;
  final List<Widget> homeItems;

  const HomeWrapper({Key key, this.drawer, this.homeItems, this.homeViewItems})
      : super(key: key);
  @override
  _HomeWrapperState createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  int currentIndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          widget.homeViewItems[currentIndex].title,
          style: Theme.of(context)
              .textTheme
              .headline
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                EvaIcons.bell,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationsView()));
              }),
          IconButton(
              icon: Icon(
                EvaIcons.keypad,
              ),
              onPressed: () {
                _scaffoldKey.currentState.openEndDrawer();
              }),
        ],
      ),
      endDrawer: widget.drawer,
      body: IndexedStack(
        index: currentIndex,
        children: widget.homeItems,
      ),
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(
                  top: BorderSide(
                      color: secondaryLight,
                      style: BorderStyle.solid,
                      width: 2.0))),
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: secondaryDark,
              primaryColor: primary,
            ),
            child: BottomNavigationBar(
              items: homeViewItems.map((item) {
                return BottomNavigationBarItem(
                    title: Text(item.title),
                    activeIcon: Icon(item.activeIcon),
                    icon: Icon(item.inactiveIcon));
              }).toList(),
              unselectedItemColor: secondaryLight,
              selectedItemColor: primary,
              onTap: bottomTapped,
              currentIndex: currentIndex,
            ),
          )),
    );
  }

  void bottomTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
