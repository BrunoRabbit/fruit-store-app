import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_store_app/routes/app_routes.dart';
import 'package:fruit_store_app/views/cart_page/bloc/cubit/rating_cubit.dart';

class ItemPageController extends ChangeNotifier {
  reset(BuildContext context) {
    Navigator.pop(
      context,
      RoutesPath.homePage,
    );
  }
}
