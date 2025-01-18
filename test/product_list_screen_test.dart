import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:smart_shopping_list/providers/product_provider.dart';
import 'package:smart_shopping_list/screens/product_list_screen.dart';

void main() {
  group('ProductListScreen Tests', () {
    testWidgets('Deve exibir mensagem inicial quando a lista de compras estiver vazia',
            (WidgetTester tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: ChangeNotifierProvider(
                create: (_) => ProductProvider(),
                child: ProductListScreen(),
              ),
            ),
          );

          expect(find.text('Adicione itens à sua lista.'), findsOneWidget);
        });

    testWidgets('Deve adicionar um item manualmente à lista de compras',
            (WidgetTester tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: ChangeNotifierProvider(
                create: (_) => ProductProvider(),
                child: ProductListScreen(),
              ),
            ),
          );

          await tester.tap(find.byIcon(Icons.add));
          await tester.pumpAndSettle();

          await tester.enterText(find.byType(TextField), 'Maçã');
          await tester.tap(find.text('Adicionar'));
          await tester.pumpAndSettle();

          expect(find.text('Maçã'), findsOneWidget);
        });

    testWidgets('Deve marcar um item como comprado',
            (WidgetTester tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: ChangeNotifierProvider(
                create: (_) => ProductProvider(),
                child: ProductListScreen(),
              ),
            ),
          );

          await tester.tap(find.byIcon(Icons.add));
          await tester.pumpAndSettle();

          await tester.enterText(find.byType(TextField), 'Banana');
          await tester.tap(find.text('Adicionar'));
          await tester.pumpAndSettle();

          await tester.tap(find.byIcon(Icons.check));
          await tester.pumpAndSettle();

          final text = tester.widget<Text>(find.text('Banana'));
          expect(text.style?.decoration, TextDecoration.lineThrough);
        });

    testWidgets('Deve excluir um item da lista de compras',
            (WidgetTester tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: ChangeNotifierProvider(
                create: (_) => ProductProvider(),
                child: ProductListScreen(),
              ),
            ),
          );

          await tester.tap(find.byIcon(Icons.add));
          await tester.pumpAndSettle();

          await tester.enterText(find.byType(TextField), 'Laranja');
          await tester.tap(find.text('Adicionar'));
          await tester.pumpAndSettle();

          expect(find.text('Laranja'), findsOneWidget);

          await tester.tap(find.byIcon(Icons.delete));
          await tester.pumpAndSettle();

          expect(find.text('Laranja'), findsNothing);
        });
  });
}
