import 'package:flutter/material.dart';
import 'package:fruit_store_app/styles/color_theme.dart';
import 'package:fruit_store_app/widgets/card_fruits.dart';

class Fruits {
  String name;
  double price;
  Color bgColor;
  String image;

  Fruits({
    required this.name,
    required this.price,
    required this.bgColor,
    required this.image,
  });
}
