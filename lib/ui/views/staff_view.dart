import 'package:flutter/material.dart';
import 'package:svuce_app/ui/views/staff_tab_view.dart';
class Staff extends StatefulWidget {
  @override
  _StaffState createState() => _StaffState();
}

class _StaffState extends State<Staff> with SingleTickerProviderStateMixin{
  @override
  void initState() { 
    super.initState();
    
  }
  TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(length: 3, child: Scaffold(
        appBar: AppBar(
          title: Text("Staff"),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelColor: Colors.redAccent,
            indicator: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.redAccent,Colors.orangeAccent]),
              borderRadius: BorderRadius.circular(50),
              color: Colors.redAccent
              ),
            tabs: [
            Tab(
              child: Align(
                alignment: Alignment.center,
                child: Text("Main",),
              ),
            ),
            Tab(
              child: Align(
                alignment: Alignment.center,
                child: Text("Department"),
              ),
            ),
            Tab(
              child: Align(
                alignment: Alignment.center,
                child: Text("Assistants"),
              ),
            ),
          ]),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: TabBarView(children: [
            StaffTabs(category: "Main",),
            StaffTabs(category: "Department",),
            StaffTabs(category: "Assistants",),
          ]),
        ),
      )),
    );
  }
} 