import 'package:flutter/material.dart';

import 'package:fruit_store_app/models/product.dart';
import 'package:fruit_store_app/routes/app_routes.dart';

class CartPage extends StatelessWidget {
  final Product? product;

  const CartPage({
    Key? key,
    required this.product,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 18),
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(),
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    size: 26,
                  ),
                  onPressed: () {
                    Navigator.pop(
                      context,
                    );
                  },
                ),
              ),
              Text('Cart Screen : ${product!.name}'),
            ],
          ),
        ),
      ),
    );
  }
}
