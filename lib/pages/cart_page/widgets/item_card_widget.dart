import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fruit_store_app/app/widgets/app_custom_text.dart';
import 'package:fruit_store_app/controllers/product_controller.dart';
import 'package:fruit_store_app/models/product.dart';
import 'package:fruit_store_app/styles/color_theme.dart';

class ItemCardWidget extends StatefulWidget {
  final Product product;
  final int index;

  const ItemCardWidget({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  @override
  State<ItemCardWidget> createState() => _ItemCardWidgetState();
}

class _ItemCardWidgetState extends State<ItemCardWidget> {
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<ProductController>(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Dismissible(
        direction: DismissDirection.endToStart,
        key: ValueKey(Random().nextDouble()),
        onDismissed: (direction) {
          _controller.deleteItem(widget.index);
        },
        background: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.red,
          ),
          child: const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ),
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
                      color: widget.product.bgColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  Positioned(
                    left: 15,
                    child: Image.asset(
                      widget.product.image!,
                      height: 80,
                      width: 100,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppCustomText(
                  label: widget.product.name!,
                  fontFamily: 'Inter-SemiBold',
                  size: 18,
                ),
                AppCustomText(
                  label: '\$' + widget.product.price.toString(),
                  richLabel: ' x${widget.product.quantity}',
                  fontFamily: 'Inter-SemiBold',
                  size: 16,
                ),
              ],
            ),
            const Spacer(),
            widget.product.isFavorite!
                ? const Icon(
                    Icons.favorite,
                    color: primaryColor,
                  )
                : const Icon(
                    Icons.favorite_border,
                    color: Colors.grey,
                  ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      _controller.increaseQuantity(widget.product);
                    },
                    child: const Icon(
                      Icons.add_outlined,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  AppCustomText(
                    label: widget.product.quantity.toString(),
                    size: 15,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      _controller.decreaseQuantity(widget.product);
                    },
                    child: const Icon(
                      Icons.remove_outlined,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
