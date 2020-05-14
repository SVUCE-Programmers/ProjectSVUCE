import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/ui/views/calender_events/events_viewmodel.dart';
import 'package:svuce_app/ui/widgets/events_list.dart';
import 'package:table_calendar/table_calendar.dart';
class CalendarEvents extends StatefulWidget {
  @override
  _CalendarEventsState createState() => _CalendarEventsState();
}

class _CalendarEventsState extends State<CalendarEvents> {
  CalendarController _controller;
  List<dynamic> _selectedevents;
  @override
  void initState(){
    super.initState();
    _controller=CalendarController();
    _selectedevents=[];
  }
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<CalendarEventsViewModel>(
      onModelReady: (model)=>model.getEvents(),
      viewModel: CalendarEventsViewModel(),  
      builder: (context, uiHelpers, model) =>Scaffold(
        body: model.eventsList!=null?Container(    
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left:20,right: 20),
              child: TableCalendar(
                startingDayOfWeek: StartingDayOfWeek.sunday,
                onDaySelected: (datetime,events){
                  setState(() {
                    _selectedevents=events;
                  });
                },
                calendarController:_controller,
                events: model.eventsList, 
                calendarStyle: CalendarStyle( 
                  contentPadding: EdgeInsets.all(0),
                  outsideDaysVisible: true,
                  todayColor: surfaceColor,
                  selectedColor: primaryColor,
                ),
                builders: CalendarBuilders(
                  dowWeekdayBuilder: (context,string){
                    return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(string)
                        ],
                    );
                  }
                ),
                headerStyle: HeaderStyle(
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
                  ),
                  formatButtonVisible: false,
                  centerHeaderTitle: true,
                  leftChevronIcon: Icon(Icons.arrow_back_ios,color:Colors.white),
                  rightChevronIcon: Icon(Icons.arrow_forward_ios,color:Colors.white),
                  headerMargin: EdgeInsets.only(top:10,bottom:20),
                  titleTextStyle: TextStyle(
                    fontSize: 20,
                    color:Colors.white
                  ),
                ),

              ),
            ),
            Expanded(
              child: EventsList(events: _selectedevents),
            )           
          ],
        )):Center(
          child:CircularProgressIndicator(),
        ),
      ), 
    );
  }
}
