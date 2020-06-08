import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/app/router.gr.dart';

import 'push_notification_service.dart';

@Singleton(as: PushNotificationService)
class PushNotificationServiceImp implements PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging();
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Future initialise() async {
    if (Platform.isIOS) {
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }

    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        _serialiseAndNavigate(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        _serialiseAndNavigate(message);
      },
    );
  }

  void _serialiseAndNavigate(Map<String, dynamic> message) {
    var notificationData = message['data'];
    var view = notificationData['view'];

    if (view != null) {
      // Navigate to the specifed view in the notification
      if (view == 'go_to_home') {
        _navigationService.navigateTo(Routes.homeViewRoute);
      }
      // If there's no view it'll just open the app on the first view
    }
  }

  @override
  Future subscribe(String topic) async {
    try {
      await _fcm.subscribeToTopic(topic);
      return true;
    } catch (e) {
      return e?.message;
    }
  }
}
