import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final double price;
  final Color bgColor;
  final String image;
  final Color iconColor;
  bool isFavorite;
  final double rating;
  // int qtdd;

  Product({
    Key? key,
    this.id = 0,
    this.name = 'Inválido',
    this.price = 0.00,
    this.bgColor = Colors.white,
    this.image = 'No Image',
    this.iconColor = Colors.black,
    this.isFavorite = false,
    this.rating = 0,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        price,
        bgColor,
        image,
        iconColor,
        isFavorite,
        rating,
      ];
}
