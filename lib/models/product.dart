import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final Color bgColor;
  final String image;
  final Color iconColor;
  bool isFavorite;

  Product({
    Key? key,
    required this.name,
    required this.price,
    required this.bgColor,
    required this.image,
    required this.iconColor,
    this.isFavorite = false,
  });
}
