import 'dart:io';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/models/event/event.dart';
import 'package:svuce_app/core/services/dynamic_links/dynamic_links.dart';
import 'package:svuce_app/core/services/share%20service/share_service.dart';
import 'package:svuce_app/ui/utils/widget_to_image.dart';

class EventDetailViewModel extends BaseViewModel {
  final log = getLogger("Event Detail view Model");
  final NavigationService _navigationService = locator<NavigationService>();
  final DynamicLinkService _dynamicLinkService = locator<DynamicLinkService>();
  GlobalKey globalKey = new GlobalKey();
  final ShareService _shareService = locator<ShareService>();
  Event event;

  shareLink(Event event) async {
    String link = await _dynamicLinkService.createEventLink(event);
    Share.share("Hey check out this event \nLink:$link");
  }

  File file;

  getImageFromWidget() async {
    file = await WidgetToImage().capturePng(globalKey);
    await _shareService.shareData(
        title: event.name, description: event.description, file: file);
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

  init(Event ref) {
    event = ref;
    notifyListeners();
  }
}
