import 'package:flutter/material.dart';
import 'package:fruit_store_app/pages/home_page/home_page.dart';
import 'package:fruit_store_app/pages/payment_page/payment_page.dart';
import 'package:fruit_store_app/pages/root/root_page.dart';
import 'package:fruit_store_app/pages/welcome/welcome_page.dart';
import 'package:fruit_store_app/pages/item_page/item_page.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> path = {
    RoutesPath.kHomePage: (_) => const HomePage(),
    RoutesPath.kItemPage: (_) => const ItemPage(),
    RoutesPath.kPresentation: (_) => const WelcomePage(),
    RoutesPath.kRootPage: (_) => const RootPage(),
    RoutesPath.kPaymentPage: (_) => const PaymentPage(),
  };
}

class RoutesPath {
  static const kHomePage = '/home-page';
  static const kItemPage = '/item-page';
  static const kRootPage = '/root-page';
  static const kPresentation = '/introduction-page';
  static const kPaymentPage = '/payment-page';
}
