import 'package:flutter/material.dart';
import 'package:fruit_store_app/models/fruits.dart';
import 'package:fruit_store_app/styles/color_theme.dart';
import 'package:fruit_store_app/widgets/card_fruits.dart';
import 'package:fruit_store_app/widgets/card_near.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  RxList<CardFruits> fruitsList = [
    CardFruits(
      name: 'Laranja',
      price: 2.89,
      bgColor: colorFirst.withOpacity(0.3),
      image: './assets/images/laranja.png',
      iconColor: colorFirst,
    ),
    CardFruits(
      name: 'Abacaxi',
      price: 3.02,
      bgColor: colorSecond.withOpacity(0.3),
      image: './assets/images/abacaxi.png',
      iconColor: colorSecond,
    ),
    CardFruits(
      name: 'Tomate',
      price: 2.01,
      bgColor: colorFirst.withOpacity(0.3),
      image: './assets/images/tomate.png',
      iconColor: colorFirst,
    ),
  ].obs;

  RxList<CardNear> listCardNear = const [
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
  ].obs;
}
