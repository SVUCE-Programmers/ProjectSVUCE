import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';

import 'package:svuce_app/core/models/event/event.dart';
import 'package:svuce_app/ui/widgets/event_widget.dart';

import 'event_detail_viewmodel.dart';

class EventDetailsView extends StatelessWidget {
  final Event event;
  final String id;

  const EventDetailsView({Key key, this.event, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<EventDetailViewModel>(
      onModelReady: (m) => m.init(event, id),
      viewModel: EventDetailViewModel(),
      builder: (context, uiHelpers, model) => Scaffold(
        appBar: AppBar(
          actions: [
            PopupMenuButton(
                onSelected: model.popupClick,
                icon: Icon(
                  Icons.more_vert,
                  color: uiHelpers.textPrimaryColor,
                ),
                itemBuilder: (_) => [
                      PopupMenuItem(
                          value: "Share",
                          child: ListTile(
                            dense: true,
                            minVerticalPadding: 0,
                            minLeadingWidth: 8,
                            horizontalTitleGap: 10,
                            title: Text("Share",
                                style: uiHelpers.title.copyWith(fontSize: 15)),
                            leading: Icon(FlutterIcons.share_2_fea,
                                color: uiHelpers.textPrimaryColor, size: 20),
                          ))
                    ])
          ],
          title: Text(
            (model.event != null && model.event.name != null)
                ? model.event?.name ?? ""
                : "Loading...",
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
        body: model.event == null
            ? SizedBox()
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RepaintBoundary(
                      key: model.globalKey,
                      child: Container(
                        height: 250,
                        child: EventWidget(event: model.event),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 10),
                      child: Text(
                        model.event?.name ?? "",
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
                      padding: const EdgeInsets.only(left: 20.0, right: 10),
                      child: Text(
                        model.event?.description ?? "",
                        style: TextStyle(
                            color: uiHelpers.textSecondaryColor, fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
