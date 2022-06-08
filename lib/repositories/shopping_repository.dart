import 'package:fruit_store_app/models/product.dart';

Duration _delay = const Duration(milliseconds: 800);

const catalog = [
  // TODO - PASSAR PARA INGLES
  'Orange',
  'Encore',
  'Lima',
  'Limão',
  'Tangerina',
];
const catalogImage = [
  './assets/images/orange.png',
  './assets/images/abacaxi.png',
  './assets/images/tomate.png',
  './assets/images/food-logo.png',
  './assets/images/yummi-food.png',
];

class ShoppingRepository {
  final _products = <Product>[];

  Future<List<String>> loadCatalog() async => Future.delayed(_delay, () {
        catalogImage;
        return catalog;
      });

  Future<List<Product>> loadCartProducts() =>
      Future.delayed(_delay, () => _products);

  void addProductToCart(Product product) => _products.add(product);

  void removeProductFromCart(Product product) => _products.add(product);
}
