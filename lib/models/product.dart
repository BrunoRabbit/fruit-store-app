import 'dart:convert';

import 'package:flutter/material.dart';

class Product {
  int? id;
  String? name;
  double? price;
  Color? bgColor;
  String? image;
  Color? iconColor;
  double? rating;
  bool? isFavorite;
  // int qtdd;

  Product({
    this.id,
    this.name,
    this.price,
    this.bgColor,
    this.image,
    this.iconColor,
    this.rating,
    this.isFavorite,
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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'bgColor': bgColor?.value,
      'image': image,
      'iconColor': iconColor?.value,
      'rating': rating,
      'isFavorite': isFavorite,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id']?.toInt(),
      name: map['name'],
      price: map['price']?.toDouble(),
      bgColor: map['bgColor'] != null ? Color(map['bgColor']) : null,
      image: map['image'],
      iconColor: map['iconColor'] != null ? Color(map['iconColor']) : null,
      rating: map['rating']?.toDouble(),
      isFavorite: map['isFavorite'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
