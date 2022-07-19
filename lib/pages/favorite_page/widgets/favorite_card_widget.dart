import 'package:flutter/material.dart';

import 'package:fruit_store_app/app/widgets/app_custom_text.dart';
import 'package:fruit_store_app/models/product.dart';
import 'package:fruit_store_app/styles/color_theme.dart';

class FavoriteCardWidget extends StatelessWidget {
  final Product product;

  const FavoriteCardWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Card(
        semanticContainer: true,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircleAvatar(
                child: Image.asset(
                  product.image!,
                  fit: BoxFit.cover,
                ),
                radius: 125 / 3,
                backgroundColor: product.bgColor,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppCustomText(
                  label: product.name!,
                  color: primaryColor,
                  size: 22,
                  fontFamily: 'Inter-SemiBold',
                ),
                AppCustomText(
                  label: '\$${product.price!}',
                  color: Colors.black.withOpacity(0.5),
                  size: 18,
                ),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppCustomText(
                  label: 'Quantity: ${product.quantity!}',
                  color: Colors.black.withOpacity(0.7),
                  size: 18,
                ),
                AppCustomText(
                  label: '${product.rating!} stars',
                  color: Colors.black.withOpacity(0.7),
                  size: 18,
                ),
              ],
            ),
            const Spacer(),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: product.isFavorite!
                    ? const Icon(
                        Icons.favorite,
                        color: primaryColor,
                      )
                    : const Icon(
                        Icons.favorite_border,
                        color: Colors.grey,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
