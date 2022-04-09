import 'package:fruit_store_app/models/product.dart';

Duration _delay = const Duration(milliseconds: 800);

const catalog = [
  'aaaaaa',
  'testeeee',
  'tres items',
  'quatro',
  'miojo',
];

class ShoppingRepository {
  final _products = <Product>[];

  Future<List<String>> loadCatalog() async =>
      Future.delayed(_delay, () => catalog);

  Future<List<Product>> loadCartProducts() =>
      Future.delayed(_delay, () => _products);

  void addProductToCart(Product product) => _products.add(product);

  void removeProductFromCart(Product product) => _products.add(product);
}
