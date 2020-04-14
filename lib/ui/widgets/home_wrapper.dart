import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:svuce_app/ui/shared/app_colors.dart';

class HomeWrapper extends StatefulWidget {
  final Widget drawer;
  final IconData appBarIcon;
  final String appBarTitle;
  final List<BottomNavigationBarItem> navItems;
  final List<Widget> homeItems;

  const HomeWrapper(
      {Key key,
      this.drawer,
      this.homeItems,
      this.appBarIcon,
      this.appBarTitle,
      this.navItems})
      : super(key: key);
  @override
  _HomeWrapperState createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  bool isCollapsed = true;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 250),
        reverseDuration: Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryDark,
        elevation: 0,
        leading:
            IconButton(icon: Icon(widget.appBarIcon, color: secondary,), onPressed: openDrawer),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Feather.bell, color: secondary,), onPressed: (){}),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          widget.drawer,
          AnimatedPositioned(
              top: isCollapsed ? 0 : 0.15 * screenHeight,
              bottom: isCollapsed ? 0 : 0.15 * screenHeight,
              left: isCollapsed ? 0 : 0.6 * screenWidth,
              right: isCollapsed ? 0 : -0.4 * screenWidth,
              child: IndexedStack(
                index: currentIndex,
                children: widget.homeItems,
              ),
              duration: Duration(milliseconds: 150))
        ],
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
              items: widget.navItems,
              unselectedItemColor: secondaryLight,
              selectedItemColor: primary,
              onTap: bottomTapped,
              currentIndex: currentIndex,
            ),
          )),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  openDrawer() {
    setState(() {
      isCollapsed = !isCollapsed;
      isCollapsed ? controller.reverse() : controller.forward();
    });
  }

  void bottomTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void pageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
