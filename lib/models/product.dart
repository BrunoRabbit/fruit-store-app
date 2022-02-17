import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final Color bgColor;
  final String image;
  final Color iconColor;
  final VoidCallback onTap;
  bool isFavorite;

  Product({
    Key? key,
    required this.name,
    required this.price,
    required this.bgColor,
    required this.image,
    required this.iconColor,
    required this.onTap,
    this.isFavorite = false,
  });
}
