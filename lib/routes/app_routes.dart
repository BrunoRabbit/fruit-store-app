import 'package:flutter/material.dart';
import 'package:fruit_store_app/views/cart_page/cart_page.dart';
import 'package:fruit_store_app/views/home_page/home_page.dart';
import 'package:fruit_store_app/views/introduction_page/introduction_page.dart';
import 'package:fruit_store_app/views/introduction_page/register_page/register_page.dart';
import 'package:fruit_store_app/views/item_page/item_page.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> path = {
    RoutesPath.homePage: (_) => const HomePage(),
    RoutesPath.itemPage: (_) => const ItemPage(),
    RoutesPath.cartPage: (_) => const CartPage(),
    RoutesPath.registerPage: (_) => const RegisterPage(),
    RoutesPath.introductionPage: (_) => IntroductionPage(),
  };
}

class RoutesPath {
  static const homePage = '/home-page';
  static const itemPage = '/item-page';
  static const cartPage = '/cart-page';
  static const registerPage = '/register-page';
  static const introductionPage = '/introduction-page';
}
