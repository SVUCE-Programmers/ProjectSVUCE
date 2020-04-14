import 'package:flutter/material.dart';
import 'package:svuce_app/ui/shared/app_colors.dart';

class HomeWrapper extends StatefulWidget {
  final Widget drawer, body, bottomNav;
  final IconData appBarIcon;
  final String appBarTitle;

  const HomeWrapper(
      {Key key,
      this.drawer,
      this.body,
      this.appBarIcon,
      this.appBarTitle,
      this.bottomNav})
      : super(key: key);
  @override
  _HomeWrapperState createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  bool isCollapsed = true;

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
        backgroundColor: primary,
        elevation: 0,
        leading:
            IconButton(icon: Icon(widget.appBarIcon), onPressed: openDrawer),
        centerTitle: true,
        title: Text(widget.appBarTitle),
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
              child: widget.body,
              duration: Duration(milliseconds: 150))
        ],
      ),
      bottomNavigationBar: widget.bottomNav,
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
}
