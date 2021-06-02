import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics();

  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);
  Future logSignUp() async {
    await _analytics.logSignUp(signUpMethod: 'email');
  }

  Future logLogin() async {
    await _analytics.logLogin(loginMethod: 'email');
  }

  Future logEvent(
      {@required String name, @required Map<String, Object> parameters}) async {
    await _analytics.logEvent(name: name, parameters: parameters);
  }

  Future logAppOpen() async {
    await _analytics.logAppOpen();
  }

  Future logSearch({@required String searchString}) async {
    await _analytics.logSearch(searchTerm: '$searchString');
  }

  Future setUserId({@required String id}) async {
    await _analytics.setUserId(id);
  }

  Future setUserProperty(
      {@required String name, @required String value}) async {
    await _analytics.setUserProperty(name: "$name", value: "$value");
  }

  Future setCurrentScreen({
    @required String screenName,
  }) async {
    await _analytics.setCurrentScreen(screenName: '$screenName');
  }
}
