import 'package:flutter/material.dart';
import 'package:fruit_store_app/app/widgets/app_custom_text.dart';

import 'package:fruit_store_app/models/product.dart';

class ItemCardWidget extends StatelessWidget {
  final Product product;

  const ItemCardWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 80,
            width: 120,
            child: Stack(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: product.bgColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                Positioned(
                  left: 15,
                  child: Image.asset(
                    product.image!,
                    height: 80,
                    width: 100,
                  ),
                ),
              ],
            ),
          ),
          AppCustomText(
            label: product.name!,
            fontFamily: 'Inter-SemiBold',
            size: 16,
          ),
        ],
      ),
    );
  }
}
