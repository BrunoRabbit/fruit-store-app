import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import 'package:fruit_store_app/models/product.dart';
import 'package:fruit_store_app/widgets/custom_text.dart';

class CustomAppBarWidget extends StatelessWidget {
  final Product? product;

  const CustomAppBarWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.centerLeft,
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
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
          const Spacer(),
          CustomText(
            label: product!.name,
            size: 26,
            fontFamily: 'Inter-Bold',
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              FeatherIcons.shoppingCart,
              size: 26,
            ),
          )
        ],
      ),
    );
  }
}
