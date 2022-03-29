import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import 'package:fruit_store_app/models/product.dart';
import 'package:fruit_store_app/widgets/custom_text.dart';

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
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 18),
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
                    size: 22,
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      FeatherIcons.bell,
                      size: 26,
                    ),
                  )
                ],
              ),
            ),
            Text('Cart Screen : ${product!.name}'),
          ],
        ),
      ),
    );
  }
}
