import 'package:flutter/material.dart';

import 'package:fruit_store_app/models/product.dart';
import 'package:fruit_store_app/styles/color_theme.dart';
import 'package:fruit_store_app/views/cart_page/item_page.dart';
import 'package:fruit_store_app/widgets/custom_text.dart';

class CardFruits extends StatelessWidget {
  final Product product;

  const CardFruits({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 25),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => ItemPage(
                product: product,
              ),
            ),
          );
        },
        child: Container(
          width: 150,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: product.bgColor,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  label: product.name,
                  size: 18,
                  fontFamily: 'Inter-Bold',
                ),
                CustomText(
                  label: '\$${product.price} each',
                  size: 14,
                  fontFamily: 'Inter-Bold',
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      product.image,
                      height: 120,
                      width: 120,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    decoration: BoxDecoration(
                        color: product.bgColor,
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(20),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.add,
                        color: product.iconColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
