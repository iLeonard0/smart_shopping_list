import 'package:flutter_test/flutter_test.dart';
import 'package:smart_shopping_list/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('Deve exibir o título SmartShopper na tela inicial', (WidgetTester tester) async {
    // Constrói a tela HomeScreen
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    // Localiza o título pelo texto
    final titleFinder = find.text('SmartShopper');

    // Verifica se o título existe
    expect(titleFinder, findsOneWidget);

    // Verifica se há um GestureDetector associado ao título
    final gestureFinder = find.ancestor(of: titleFinder, matching: find.byType(GestureDetector));
    expect(gestureFinder, findsOneWidget);
  });
}
