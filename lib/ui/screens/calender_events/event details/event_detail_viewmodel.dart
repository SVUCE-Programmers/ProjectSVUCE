import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/models/event/event.dart';
import 'package:svuce_app/core/repositories/events_repository/events_repository.dart';
import 'package:svuce_app/core/services/dynamic_links/dynamic_links.dart';
import 'package:svuce_app/core/services/share%20service/share_service.dart';
import 'package:svuce_app/ui/utils/widget_to_image.dart';

class EventDetailViewModel extends BaseViewModel {
  final log = getLogger("Event Detail view Model");
  final NavigationService _navigationService = locator<NavigationService>();
  final EventsRepository _eventsRepository = locator<EventsRepository>();
  final DynamicLinkService _dynamicLinkService = locator<DynamicLinkService>();
  GlobalKey globalKey = new GlobalKey();
  final ShareService _shareService = locator<ShareService>();
  Event event;

  shareLink() async {
    String link = await _dynamicLinkService.createEventLink(event);
    return link;
  }

  File file;

  getImageFromWidget() async {
    setBusy(true);
    file = await WidgetToImage().capturePng(globalKey);
    String urlLink = await shareLink();
    setBusy(false);

    await _shareService.shareData(
        title: event.name,
        description: event.description + "\n\nLink to event:$urlLink",
        file: file);
  }

  popupClick(String value) {
    switch (value) {
      case "Share":
        getImageFromWidget();

        break;
      default:
    }
  }

  goBack() {
    _navigationService.back();
  }

  init(Event ref, String id) async {
    if (id != null) {
      setBusy(true);
      var data = await _eventsRepository.getEventDetails(id);
      log.i("Got data is:$data");
      if (data != null) {
        ref = data;
      }
      setBusy(false);
    }
    event = ref;
    notifyListeners();
  }
}
