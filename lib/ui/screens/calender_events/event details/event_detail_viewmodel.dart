import 'package:share_plus/share_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/models/event/event.dart';
import 'package:svuce_app/core/services/dynamic_links/dynamic_links.dart';

class EventDetailViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DynamicLinkService _dynamicLinkService = locator<DynamicLinkService>();
  shareLink(Event event) async {
    String link = await _dynamicLinkService.createEventLink(event);
    Share.share("Hey check out this event \nLink:$link");
  }

  goBack() {
    _navigationService.back();
  }
}
