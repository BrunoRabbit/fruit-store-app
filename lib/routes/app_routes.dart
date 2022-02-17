import 'package:flutter/material.dart';
import 'package:fruit_store_app/views/home_page/home_page.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> path = {
    RoutesPath.firstPage: (_) => const HomePage(),
  };
}

class RoutesPath {
  static const firstPage = '/first-page';
}
