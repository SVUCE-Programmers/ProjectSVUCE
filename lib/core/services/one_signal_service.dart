import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:svuce_app/app/configs.dart';

class OneSignalService {
  initialise() async {
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.setRequiresUserPrivacyConsent(true);

    var settings = {
      OSiOSSettings.autoPrompt: false,
      OSiOSSettings.promptBeforeOpeningPushUrl: true
    };

    OneSignal.shared
        .setNotificationReceivedHandler((OSNotification notification) {});

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {});

    OneSignal.shared
        .setInAppMessageClickedHandler((OSInAppMessageAction action) {});

    OneSignal.shared
        .setSubscriptionObserver((OSSubscriptionStateChanges changes) {
      print("SUBSCRIPTION STATE CHANGED: ${changes.jsonRepresentation()}");
    });

    OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
      print("PERMISSION STATE CHANGED: ${changes.jsonRepresentation()}");
    });

    OneSignal.shared.setEmailSubscriptionObserver(
        (OSEmailSubscriptionStateChanges changes) {
      print("EMAIL SUBSCRIPTION STATE CHANGED ${changes.jsonRepresentation()}");
    });

    // NOTE: Replace with your own app ID from https://www.onesignal.com
    await OneSignal.shared.init(ApiKeys.oneSignalKey, iOSSettings: settings);

    OneSignal.shared
        .setInFocusDisplayType(OSNotificationDisplayType.notification);

    bool requiresConsent = await OneSignal.shared.requiresUserPrivacyConsent();
    OneSignal.shared.setRequiresUserPrivacyConsent(true);
  }
}
