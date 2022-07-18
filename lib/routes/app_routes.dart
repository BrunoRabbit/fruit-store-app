import 'package:flutter/material.dart';
import 'package:fruit_store_app/pages/home_page/home_page.dart';
import 'package:fruit_store_app/pages/root/root_page.dart';
import 'package:fruit_store_app/pages/welcome/welcome_page.dart';
import 'package:fruit_store_app/pages/item_page/item_page.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> path = {
    RoutesPath.homePage: (_) => const HomePage(),
    RoutesPath.itemPage: (_) => const ItemPage(),
    // RoutesPath.cartPage: (_) => const CartPage(),
    RoutesPath.introductionPage: (_) => const WelcomePage(),
    RoutesPath.rootPage: (_) => const RootPage(),
    // RoutesPath.registerPage: (_) => const RegisterPage(),
    // RoutesPath.loginPage: (_) => const LoginPage(),
  };
}

class RoutesPath {
  static const homePage = '/home-page';
  static const itemPage = '/item-page';
  static const rootPage = '/root-page';
  // static const cartPage = '/cart-page';
  static const introductionPage = '/introduction-page';
  // static const registerPage = '/register-page';
  // static const loginPage = '/login-page';
}
