import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:experiment12_app/main.dart';

void main() {
  testWidgets("Counter increments when button is pressed", (
    WidgetTester tester,
  ) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the initial counter value is 0.
    expect(find.text('0'), findsOneWidget);

    // Verify that increment button is incrementing the counter
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump(); // Rebuild the widget after the state has changed.

    expect(find.text('1'), findsOneWidget);
  });
}
