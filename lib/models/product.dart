import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final double price;
  final Color bgColor;
  final String image;
  final Color iconColor;
  final double rating;
  bool isFavorite;
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

  void toogleFavorite() {
    isFavorite = !isFavorite;
  }

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

/**
 * import 'package:flutter/material.dart';

class Product {
  int? id;
  String? name;
  double? price;
  Color? bgColor;
  String? image;
  Color? iconColor;
  bool? isFavorite;
  double? rating;
  // int qtdd;

  // Product({
  //   Key? key,
  //   this.id = 0,
  //   this.name = 'Inválido',
  //   this.price = 0.00,
  //   this.bgColor = Colors.white,
  //   this.image = 'No Image',
  //   this.iconColor = Colors.black,
  //   this.isFavorite = false,
  //   this.rating = 0,
  // });

  static final Product _inst = Product._internal();

  Product._internal();

  factory Product({
    int? id,
    String? name,
    double? price,
    Color? bgColor,
    String? image,
    Color? iconColor,
    bool? isFavorite,
    double? rating,
  }) {
    _inst.id = id;
    _inst.name = name;
    _inst.price = price;
    _inst.bgColor = bgColor;
    _inst.image = image;
    _inst.iconColor = iconColor;
    _inst.isFavorite = isFavorite;
    _inst.rating = rating;

    return _inst;
  }

  // @override
  // List<Object?> get props => [
  //       id,
  //       name,
  //       price,
  //       bgColor,
  //       image,
  //       iconColor,
  //       isFavorite,
  //       rating,
  //     ];
}

 */