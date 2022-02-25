import 'package:flutter/material.dart';
import 'package:fruit_store_app/models/product.dart';
import 'package:fruit_store_app/routes/app_routes.dart';

class ItemPageController {
  reset(BuildContext context) {
    Navigator.pop(
      context,
      RoutesPath.homePage,
    );
  }
}
