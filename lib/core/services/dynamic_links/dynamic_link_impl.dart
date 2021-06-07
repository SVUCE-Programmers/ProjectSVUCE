import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/locator.dart';

import 'package:svuce_app/core/models/event/event.dart';

import 'dynamic_links.dart';

@Singleton(as: DynamicLinkService)
class DynamicLinkServiceImpl implements DynamicLinkService {
  // for testing
  DynamicLinkServiceImpl();
  final NavigationService _navigationService = locator<NavigationService>();

  Future handleDynamicLinks() async {
    final PendingDynamicLinkData data =
        await FirebaseDynamicLinks.instance.getInitialLink();

    _handleDeepLink(data);

    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
      _handleDeepLink(dynamicLink);
    }, onError: (OnLinkErrorException e) async {
      print('Link Failed: ${e.message}');
    });
  }

  void _handleDeepLink(PendingDynamicLinkData data) {
    final Uri deepLink = data?.link;
    if (deepLink != null) {
      print('_handleDeepLink | deeplink: $deepLink');

      var isEvent = deepLink.pathSegments.contains('event');
      if (isEvent) {}
    }
  }

  Future<String> createEventLink(Event event) async {
    print("Enterex");
    final DynamicLinkParameters params = DynamicLinkParameters(
      uriPrefix: 'https://svuce.page.link',
      link: Uri.parse('https://svuce.page.link/event?id=${event.id}'),
      androidParameters: AndroidParameters(
        packageName: 'com.svuce.svuce_app',
      ),

      // iosParameters: IosParameters(
      //   bundleId: 'com.example.ios',
      //   minimumVersion: '1.0.1',
      //   appStoreId: '123456789',
      // ),
      googleAnalyticsParameters: GoogleAnalyticsParameters(
        campaign: 'Event-Link',
        medium: 'social',
        source: 'orkut',
      ),

      socialMetaTagParameters: SocialMetaTagParameters(
        title: event.name,
        description: event.description.substring(0, 50),
      ),
    );

    var kiu = await params.buildUrl();
    var k = await DynamicLinkParameters.shortenUrl(
        kiu,
        DynamicLinkParametersOptions(
            shortDynamicLinkPathLength:
                ShortDynamicLinkPathLength.unguessable));
    var shortUrl = k.shortUrl;
    print(shortUrl.toString());
    return shortUrl.toString();
  }
}
