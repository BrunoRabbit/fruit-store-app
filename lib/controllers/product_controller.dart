import 'package:flutter/material.dart';
import 'package:fruit_store_app/data/data.dart';
import 'package:fruit_store_app/models/product.dart';

class ProductController extends ChangeNotifier {
  List<Product> productList = [];

  Future<bool?> changeFavorite(Product product) async {
    try {
      product.isFavorite = !product.isFavorite!;
      product.copyWith(
        isFavorite: product.isFavorite,
      );
      notifyListeners();
      return true;
    } catch (e) {
      Exception('Something went wrong');
      notifyListeners();
      return false;
    }
  }

  void addToCart(Product product) {
    try {
      cartList.add(product);
    } catch (e) {
      Exception('Something went wrong');
    }

    notifyListeners();
  }
}
