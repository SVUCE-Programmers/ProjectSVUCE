import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:svuce_app/locator.dart';
import 'package:svuce_app/ui/views/login_view.dart';

void main() {
  setUpAll(() {
    setupLocator();
  });

  // This method is used to make any widget testable
  Widget makeTestable(Widget child) {
    return MaterialApp(
      home: child,
    );
  }

  //getting the required widgets to test
  var emailField = find.byKey(Key("EmailField"));
  var passwordField = find.byKey(Key("PasswordField"));
  var signInButton = find.byKey(Key("SigninButton"));

  group("test login page", () {
    testWidgets("expected widgets lies", (WidgetTester tester) async {
      await tester.pumpWidget(makeTestable(LoginView()));
      // make sure that these widgets lies in the widget tree
      expect(emailField, findsOneWidget);
      expect(passwordField, findsOneWidget);
      expect(signInButton, findsOneWidget);
    });

    testWidgets("empty fields return error", (WidgetTester tester) async {
      await tester.pumpWidget(makeTestable(LoginView()));
      await tester.tap(signInButton);
      await tester.pump();
      expect(find.text("Try again"), findsOneWidget);
    });

    testWidgets("email length less than 5 returns error",
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestable(LoginView()));
      await tester.enterText(emailField, "emai");
      await tester.tap(signInButton);
      await tester.pump();
      expect(find.text("Try again"), findsOneWidget);
    });

    testWidgets("password length less than 5 returns error",
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestable(LoginView()));
      await tester.enterText(passwordField, "incorrectemailstring");
      await tester.tap(signInButton);
      await tester.pump();
      expect(find.text("Try again"), findsOneWidget);
    });

    testWidgets("invalid email string returns error",
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestable(LoginView()));
      await tester.enterText(emailField, "incorrectemailstring");
      await tester.tap(signInButton);
      await tester.pump();
      expect(find.text("Try again"), findsOneWidget);
    });
  });
}
