import 'package:flutter/material.dart';

class Product {
  int id;
  String name;
  double price;
  Color bgColor;
  String image;
  Color iconColor;
  double rating;
  bool isFavorite;
  // int qtdd;

  Product({
    Key? key,
    required this.id,
    this.name = 'Inválido',
    this.price = 0.00,
    this.bgColor = Colors.white,
    this.image = 'No Image',
    this.iconColor = Colors.black,
    this.isFavorite = false,
    this.rating = 0,
  });

  Product copyWith({
    int? id,
    String? name,
    double? price,
    Color? bgColor,
    String? image,
    Color? iconColor,
    double? rating,
    bool? isFavorite,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      bgColor: bgColor ?? this.bgColor,
      image: image ?? this.image,
      iconColor: iconColor ?? this.iconColor,
      rating: rating ?? this.rating,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
