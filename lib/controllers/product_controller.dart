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

  increaseQuantity(Product product) {
    int quantity = 0;
    if (product.quantity != null) {
      quantity = product.quantity!;

      quantity++;

      product.quantity = quantity;

      product.copyWith(
        quantity: product.quantity,
      );
      notifyListeners();
    }
  }

  decreaseQuantity(Product product) {
    int quantity;

    if (product.quantity != null && product.quantity! > 1) {
      quantity = product.quantity!;

      quantity--;

      product.quantity = quantity;

      product.copyWith(
        quantity: product.quantity,
      );
      notifyListeners();
    }
  }
}
