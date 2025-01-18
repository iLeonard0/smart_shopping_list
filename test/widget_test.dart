import 'package:flutter_test/flutter_test.dart';
import 'package:smart_shopping_list/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('Deve exibir o título SmartShopper na tela inicial', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    final titleFinder = find.text('SmartShopper');

    expect(titleFinder, findsOneWidget);

    final gestureFinder = find.ancestor(of: titleFinder, matching: find.byType(GestureDetector));
    expect(gestureFinder, findsOneWidget);
  });
}
