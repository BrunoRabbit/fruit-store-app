import 'package:fruit_store_app/models/product.dart';
import 'package:fruit_store_app/styles/color_theme.dart';
import 'package:fruit_store_app/pages/home_page/widgets/card_near.dart';

List<Product> fruitsList = [
  Product(
    id: 0,
    name: 'Orange',
    quantity: 1,
    price: 2.89,
    bgColor: primaryColor.withOpacity(0.3),
    image: './assets/images/orange.png',
    iconColor: primaryColor,
    isFavorite: false,
    rating: 2.0,
    // qtdd: 1,
  ),
  Product(
    id: 1,
    quantity: 1,
    name: 'Pineapple',
    price: 3.02,
    bgColor: secondaryColor.withOpacity(0.3),
    image: './assets/images/abacaxi.png',
    iconColor: secondaryColor,
    isFavorite: false,
    rating: 3.0,
    // qtdd: 1,
  ),
  Product(
    id: 2,
    quantity: 1,
    name: 'Tomato',
    price: 2.01,
    bgColor: primaryColor.withOpacity(0.3),
    image: './assets/images/tomate.png',
    iconColor: primaryColor,
    isFavorite: false,
    rating: 5.0,
    // qtdd: 1,
  ),
];

List<CardNear> listCardNear = const [
  CardNear(
    title: 'Good Food',
    hours: '09:00 - 12:00',
    stars: '49',
    distance: '15 km',
    image: './assets/images/food-logo.png',
  ),
  CardNear(
    title: 'Yummi Food',
    hours: '08:00 - 15:00',
    stars: '36',
    distance: '23 km',
    image: './assets/images/yummi-food.png',
  ),
];

List<Product> cartList = [];
