import 'package:flutter/material.dart';
import 'package:fruit_store_app/views/cart_page/item_page.dart';
import 'package:fruit_store_app/views/home_page/home_page.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> path = {
    RoutesPath.homePage: (_) => const HomePage(),
    RoutesPath.itemPage: (_) => const ItemPage(),
  };
}

class RoutesPath {
  static const homePage = '/home-page';
  static const itemPage = '/item-page';
}
