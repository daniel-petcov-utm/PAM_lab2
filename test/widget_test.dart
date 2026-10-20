import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab_2/main.dart';

void main() {
  testWidgets('category selection updates when tapped', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('GemStore'), findsOneWidget);
    expect(find.text('Women'), findsOneWidget);

    await tester.tap(find.text('Men'));
    await tester.pumpAndSettle();

    final selectedIcon = tester.widget<Icon>(find.byIcon(Icons.male_outlined));
    expect(selectedIcon.color, Colors.white);
  });
}
