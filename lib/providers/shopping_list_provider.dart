import 'package:flutter/material.dart';

class ShoppingListProvider with ChangeNotifier {
  List<Map<String, dynamic>> _shoppingList = [];

  List<Map<String, dynamic>> get shoppingList => _shoppingList;

  void addItem(String item) {
    _shoppingList.add({'name': item, 'isBought': false});
    notifyListeners();
  }

  void removeItem(int index) {
    _shoppingList.removeAt(index);
    notifyListeners();
  }

  void toggleBoughtStatus(int index) {
    _shoppingList[index]['isBought'] = !_shoppingList[index]['isBought'];
    notifyListeners();
  }
}
