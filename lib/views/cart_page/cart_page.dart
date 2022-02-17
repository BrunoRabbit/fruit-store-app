import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_store_app/controllers/cart_page_controller.dart';
import 'package:fruit_store_app/styles/color_theme.dart';
import 'package:fruit_store_app/views/cart_page/widgets/item_description.dart';
import 'package:fruit_store_app/views/cart_page/widgets/item_price.dart';

import 'package:fruit_store_app/widgets/card_fruits.dart';
import 'package:fruit_store_app/widgets/custom_text.dart';
import 'package:fruit_store_app/widgets/star_icon.dart';

class CartPage extends StatelessWidget {
  final CardFruits fruits;

  const CartPage({
    Key? key,
    required this.fruits,
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
                  fruits.image,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
              ItemPrice(
                fruits: fruits,
              ),
              ItemDescription(
                fruits: fruits,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
