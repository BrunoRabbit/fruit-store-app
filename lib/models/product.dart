import 'package:flutter/material.dart';

class Product {
  final String name;
  double price;
  final Color bgColor;
  final String image;
  final Color iconColor;
  bool isFavorite;
  final double rating;
  int qtdd;

  Product({
    Key? key,
    required this.name,
    required this.price,
    required this.bgColor,
    required this.image,
    required this.iconColor,
    this.isFavorite = false,
    required this.rating,
    required this.qtdd,
  });
}
