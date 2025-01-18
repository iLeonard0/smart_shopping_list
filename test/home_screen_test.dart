import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_shopping_list/screens/home_screen.dart';

void main() {
  group('HomeScreen Tests', () {
    testWidgets('Deve exibir o nome do app "SmartShopper"',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const HomeScreen(),
        ),
      );

      expect(find.text('SmartShopper'), findsOneWidget);
    });

    testWidgets(
        'Deve navegar para a tela de produtos ao tocar no texto "SmartShopper"',
        (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();

      await tester.pumpWidget(
        MaterialApp(
          home: const HomeScreen(),
          routes: {
            '/products': (context) =>
                const Scaffold(body: Text('Tela de Produtos')),
          },
          navigatorObservers: [mockObserver],
        ),
      );

      await tester.tap(find.text('SmartShopper'));
      await tester.pumpAndSettle();

      expect(find.text('Tela de Produtos'), findsOneWidget);
    });
  });
}

class MockNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
  }
}
