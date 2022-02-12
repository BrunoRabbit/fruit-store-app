import 'package:flutter/material.dart';

import 'package:fruit_store_app/widgets/card_fruits.dart';

class CartPage extends StatelessWidget {
  final CardFruits fruits;

  const CartPage({
    Key? key,
    required this.fruits,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(fruits.name),
      ),
      body: Container(),
    );
  }
}
