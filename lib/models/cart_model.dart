import 'package:equatable/equatable.dart';
import 'package:fruit_store_app/models/product.dart';

class CartModel extends Equatable {
  final List<Product> products;

  const CartModel({this.products = const <Product>[]});

  int get totalPrice {
    // fold para duplicar
    return products.fold(
        0, (total, current) => total + current.price.truncate());
  }

  @override
  List<Object?> get props => [products];
}
