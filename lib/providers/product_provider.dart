import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../source/remote/rest_client.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  final RestClient _client = RestClient(Dio());

  List<Product> _products = [];

  List<Product> get products => _products;

  List<Map<String, dynamic>> _shoppingList = [];

  List<Map<String, dynamic>> get shoppingList => _shoppingList;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _client.fetchProducts();
      _products = response.products;
    } catch (error) {
      print("Erro ao buscar produtos: $error");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

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
