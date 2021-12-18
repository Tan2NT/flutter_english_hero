// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:english_hero/ui/components/app_top_bar.dart';
import 'package:english_hero/ui/main/authentication/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  myAppBarTest();
  authScreenTest();
}

Widget createWidgetForTesting(Widget childWidget) {
  return MediaQuery(
      data: const MediaQueryData(),
      child: MaterialApp(
        home: childWidget,
      ));
}

void authScreenTest() {
  testWidgets('Authenticate screen test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(createWidgetForTesting(const AuthScreen()));

    // Verify if username and password present
    expect(find.byKey(const Key('tff_email')), findsOneWidget);
    expect(find.byKey(const Key('tff_password')), findsOneWidget);
    expect(find.byKey(const Key('btn_submit')), findsOneWidget);
    expect(find.byKey(const Key('btn_login_switch')), findsOneWidget);

    // Enter user information
    await tester.enterText(
        find.byKey(const Key('tff_email')), 'tanhoang@gmail.com');
    await tester.enterText(find.byKey(const Key('tff_password')), '111111');

    // Verify if user information has filled
    expect(find.text('tanhoang@gmail.com'), findsOneWidget);
    expect(find.text('111111'), findsOneWidget);
  });
}

void myAppBarTest() {
  testWidgets('MyAppBar test', (WidgetTester tester) async {
    await tester.pumpWidget(
        createWidgetForTesting(Builder(builder: (BuildContext context) {
      return MyAppBar(context, "Home", false);
    })));

    // verify if Title at Home Screen is 'Home'
    expect(find.text('Home'), findsOneWidget);

    // verify if Back button is invisible at Home screen
    expect(find.byIcon(Icons.arrow_back_ios), findsNothing);
  });
}
