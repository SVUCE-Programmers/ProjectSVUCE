// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:svuce_app/locator.dart';
import 'package:svuce_app/main.dart';

void main() {
  setUpAll(() {
    setupLocator();
  });
  testWidgets('Testing Login', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MainApp());

    //find and verify your widget
    var rollNotextField = find.byKey(Key('rollNoTextField'));
    expect(rollNotextField, findsNWidgets(1));

    //ensure that you're able to type
    await tester.enterText(rollNotextField, '112');
    expect(find.text('112'), findsOneWidget);

    //find button
    var button = find.byType(RaisedButton);
    expect(button, findsNWidgets(1));

    await tester.tap(button);
    await tester.pump(const Duration(seconds: 3));

    expect(find.text("Failed"), findsOneWidget);
  });
}
