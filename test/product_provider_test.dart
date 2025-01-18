import 'package:flutter_test/flutter_test.dart';
import 'package:smart_shopping_list/providers/product_provider.dart';

void main() {
  group('ProductProvider Test', () {
    test('Deve carregar produtos com sucesso', () async {
      final provider = ProductProvider();
      await provider.fetchProducts();

      expect(provider.products.isNotEmpty, true);

      expect(provider.isLoading, false);
    });
  });
}