import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_custom_timer/flutter_custom_timer.dart';

void main() {
  testWidgets('CountdownTimer shows formatted time', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CountdownTimer(duration: Duration(seconds: 5)),
        ),
      ),
    );

    expect(find.text('00:00:05'), findsOneWidget);
  });
}
