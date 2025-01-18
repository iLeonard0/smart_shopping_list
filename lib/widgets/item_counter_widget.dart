import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';

class ItemCounterWidget extends StatelessWidget {
  const ItemCounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final shoppingList = Provider.of<ProductProvider>(context).shoppingList;
    final itemCount = shoppingList.length;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textAlign: TextAlign.center,
            'Itens na lista: $itemCount',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
