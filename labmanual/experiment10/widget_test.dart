import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:counter_app/main.dart'; // Update with your project name

void main() {
  testWidgets("Counter increments when button is pressed", (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(const CounterApp());

    // Verify initial value is 0
    expect(find.text('0'), findsOneWidget);

    // Tap the increment button
    await tester.tap(find.byKey(const Key("incrementButton")));
    await tester.pump(); // Rebuild after state change

    // Verify value changed to 1
    expect(find.text('1'), findsOneWidget);
  });
}
