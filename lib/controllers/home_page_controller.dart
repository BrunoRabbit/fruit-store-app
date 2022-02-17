import 'package:fruit_store_app/styles/color_theme.dart';
import 'package:fruit_store_app/widgets/card_fruits.dart';
import 'package:fruit_store_app/widgets/card_near.dart';

class HomePageController {
  List<CardFruits> fruitsList = [
    CardFruits(
      onTap: () {},
      name: 'Laranja',
      price: 2.89,
      bgColor: primaryColor.withOpacity(0.3),
      image: './assets/images/orange.png',
      iconColor: primaryColor,
    ),
    CardFruits(
      onTap: () {},
      name: 'Abacaxi',
      price: 3.02,
      bgColor: secondaryColor.withOpacity(0.3),
      image: './assets/images/abacaxi.png',
      iconColor: secondaryColor,
    ),
    CardFruits(
      onTap: () {},
      name: 'Tomate',
      price: 2.01,
      bgColor: primaryColor.withOpacity(0.3),
      image: './assets/images/tomate.png',
      iconColor: primaryColor,
    ),
  ];

  List<CardNear> listCardNear = const [
    CardNear(
      title: 'Lojas Food',
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
}
