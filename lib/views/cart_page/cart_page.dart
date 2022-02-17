import 'package:flutter/material.dart';
import 'package:fruit_store_app/models/product.dart';
import 'package:fruit_store_app/views/cart_page/widgets/item_description.dart';
import 'package:fruit_store_app/views/cart_page/widgets/item_price.dart';
import 'package:fruit_store_app/widgets/card_fruits.dart';

class CartPage extends StatelessWidget {
  final Product product;

  const CartPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Image.asset(
                  product.image,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
              ItemPrice(
                fruits: product,
                subTitle: 'Sweet and Juicy',
              ),
              ItemDescription(
                fruits: product,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
