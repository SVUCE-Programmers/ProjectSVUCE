import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:svuce_app/app/icons.dart';

import 'package:svuce_app/core/models/event/event.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';
import 'package:svuce_app/ui/widgets/event_widget.dart';

import 'event_detail_viewmodel.dart';

class EventDetailsView extends StatelessWidget {
  final Event event;
  final Function share;

  const EventDetailsView({Key key, this.event, this.share}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UiHelpers uiHelpers = UiHelpers.fromContext(context);

    return SafeArea(
        child: ViewModelBuilder<EventDetailViewModel>.reactive(
      viewModelBuilder: () => EventDetailViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            event.name,
            style: uiHelpers.headline,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: model.goBack,
            icon: Icon(
              backIcon,
              color: uiHelpers.textPrimaryColor,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {},
            backgroundColor: uiHelpers.primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            label: Center(
              child: Text(
                "Add to calendar",
                style: uiHelpers.button,
              ),
            )),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 250,
                child: EventWidget(event: event),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 10),
                child: Text(
                  event.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: uiHelpers.textPrimaryColor),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 10),
                child: Text(
                  event.description,
                  style: TextStyle(
                      color: uiHelpers.textSecondaryColor, fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
