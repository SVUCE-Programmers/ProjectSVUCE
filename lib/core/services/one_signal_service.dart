import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/configs.dart';

class OneSignalService {
  final log = getLogger("One Signal Service");
  initialise() async {
    await OneSignal.shared.setRequiresUserPrivacyConsent(false);
    await OneSignal.shared.init(ApiKeys.oneSignalKey);
    OneSignal.shared
        .setInFocusDisplayType(OSNotificationDisplayType.notification);
    OneSignal.shared
        .setNotificationReceivedHandler((OSNotification notification) {
      log.i(notification.jsonRepresentation());
    });

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      // will be called whenever a notification is opened/button pressed.
    });

    OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
      // will be called whenever the permission changes
      // (ie. user taps Allow on the permission prompt in iOS)
    });

    OneSignal.shared
        .setSubscriptionObserver((OSSubscriptionStateChanges changes) {
      // will be called whenever the subscription changes
      //(ie. user gets registered with OneSignal and gets a user ID)
    });

    OneSignal.shared.setEmailSubscriptionObserver(
        (OSEmailSubscriptionStateChanges emailChanges) {
      // will be called whenever then user's email subscription changes
      // (ie. OneSignal.setEmail(email) is called and the user gets registered
    });
  }
}
