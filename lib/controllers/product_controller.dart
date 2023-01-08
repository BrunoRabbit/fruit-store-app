import 'package:flutter/material.dart';
import 'package:fruit_store_app/data/data.dart';
import 'package:fruit_store_app/models/product.dart';

class ProductController extends ChangeNotifier {
  double sum = 0.0;
  bool isChecked = false;
  bool isFromNavbar = false;
  List<Product> favoriteList = [];

  void deleteItem(int id) {
    sum -= (cartList[id].price!.abs() * cartList[id].quantity!);
    cartList.removeAt(id);
    notifyListeners();
  }

  addToFavorite(Product product) {
    if (product.isFavorite!) {
      favoriteList.add(product);
    } else {
      favoriteList.remove(product);
    }
  }

  Future<bool?> changeFavorite(Product product) async {
    try {
      product.isFavorite = !product.isFavorite!;
      product.copyWith(
        isFavorite: product.isFavorite,
      );
      await addToFavorite(product);
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
      modifyTotalSum(true);
    }
    notifyListeners();
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

      modifyTotalSum(false);
    }
    notifyListeners();
  }

  double modifyTotalSum(bool isSum) {
    if (isSum) {
      sum = cartList.fold<double>(
        0,
        (previousValue, element) => previousValue + element.totalPrice(),
      );
    } else {
      sum = cartList
          .fold<double>(
            0,
            (previousValue, element) => previousValue - element.totalPrice(),
          )
          .abs();
    }
    return sum;
  }
}
