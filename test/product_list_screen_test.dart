import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:smart_shopping_list/providers/product_provider.dart';
import 'package:smart_shopping_list/screens/product_list_screen.dart';

void main() {
  group('ProductListScreen Tests', () {
    testWidgets('Deve exibir mensagem inicial quando a lista de compras estiver vazia',
            (WidgetTester tester) async {
          // Build the ProductListScreen
          await tester.pumpWidget(
            MaterialApp(
              home: ChangeNotifierProvider(
                create: (_) => ProductProvider(),
                child: ProductListScreen(),
              ),
            ),
          );

          // Verifica se a mensagem inicial está presente
          expect(find.text('Adicione itens à sua lista.'), findsOneWidget);
        });

    testWidgets('Deve adicionar um item manualmente à lista de compras',
            (WidgetTester tester) async {
          // Build the ProductListScreen
          await tester.pumpWidget(
            MaterialApp(
              home: ChangeNotifierProvider(
                create: (_) => ProductProvider(),
                child: ProductListScreen(),
              ),
            ),
          );

          // Toca no botão de adicionar item
          await tester.tap(find.byIcon(Icons.add));
          await tester.pumpAndSettle();

          // Insere um texto no campo de diálogo
          await tester.enterText(find.byType(TextField), 'Maçã');
          await tester.tap(find.text('Adicionar'));
          await tester.pumpAndSettle();

          // Verifica se o item foi adicionado à lista
          expect(find.text('Maçã'), findsOneWidget);
        });

    testWidgets('Deve marcar um item como comprado',
            (WidgetTester tester) async {
          // Build the ProductListScreen
          await tester.pumpWidget(
            MaterialApp(
              home: ChangeNotifierProvider(
                create: (_) => ProductProvider(),
                child: ProductListScreen(),
              ),
            ),
          );

          // Adiciona um item
          await tester.tap(find.byIcon(Icons.add));
          await tester.pumpAndSettle();

          await tester.enterText(find.byType(TextField), 'Banana');
          await tester.tap(find.text('Adicionar'));
          await tester.pumpAndSettle();

          // Toca no botão de marcar como comprado
          await tester.tap(find.byIcon(Icons.check));
          await tester.pumpAndSettle();

          // Verifica se o item foi riscado (TextDecoration.lineThrough)
          final text = tester.widget<Text>(find.text('Banana'));
          expect(text.style?.decoration, TextDecoration.lineThrough);
        });

    testWidgets('Deve excluir um item da lista de compras',
            (WidgetTester tester) async {
          // Build the ProductListScreen
          await tester.pumpWidget(
            MaterialApp(
              home: ChangeNotifierProvider(
                create: (_) => ProductProvider(),
                child: ProductListScreen(),
              ),
            ),
          );

          // Adiciona um item
          await tester.tap(find.byIcon(Icons.add));
          await tester.pumpAndSettle();

          await tester.enterText(find.byType(TextField), 'Laranja');
          await tester.tap(find.text('Adicionar'));
          await tester.pumpAndSettle();

          // Verifica se o item foi adicionado
          expect(find.text('Laranja'), findsOneWidget);

          // Toca no botão de deletar o item
          await tester.tap(find.byIcon(Icons.delete));
          await tester.pumpAndSettle();

          // Verifica se o item foi removido
          expect(find.text('Laranja'), findsNothing);
        });
  });
}
