import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';

class LoginWrapper extends StatefulWidget {
  final Widget student, teacher, info;
  final Function continueAsGuest;

  const LoginWrapper(
      {Key key, this.student, this.teacher, this.continueAsGuest, this.info})
      : super(key: key);

  @override
  _LoginWrapperState createState() => _LoginWrapperState();
}

class _LoginWrapperState extends State<LoginWrapper>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(width, height / 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: width / 2,
              child: TabBar(
                controller: _tabController,
                tabs: [
                  Tab(text: "Student"),
                  Tab(text: "Teacher"),
                ],
                indicatorColor: primaryColor,
                indicatorPadding: EdgeInsets.all(0),
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: primaryColor,
                unselectedLabelColor: Colors.white,
              ),
            ),
            widget.info
          ],
        ),
      ),
      body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [
            widget.student,
            widget.teacher,
          ]),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(20.0),
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(color: primaryColor, width: 4),
            borderRadius: BorderRadius.circular(10)),
        child: FlatButton(
            onPressed: widget.continueAsGuest ?? null,
            child: Center(
              child: Text(
                "Continue as Guest",
                style: TextStyle(color: primaryColor, fontSize: 16),
              ),
            )),
      ),
    );
  }
}
