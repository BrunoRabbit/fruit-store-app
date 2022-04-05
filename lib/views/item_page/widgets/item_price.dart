import 'package:flutter/material.dart';
import 'package:fruit_store_app/models/product.dart';
import 'package:fruit_store_app/styles/color_theme.dart';
import 'package:fruit_store_app/widgets/custom_text.dart';
import 'package:fruit_store_app/widgets/like_button_widget.dart';

class ItemPrice extends StatelessWidget {
  final Product product;
  final String subTitle;

  const ItemPrice({
    Key? key,
    required this.product,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              label: product.name,
              size: 33,
              fontFamily: 'Inter-Bold',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomText(
              label: subTitle,
              size: 18,
              color: Colors.black54,
              fontFamily: 'Inter-Medium',
            ),
            const SizedBox(
              height: 15,
            ),
            const CustomText(
              label: 'Price',
              size: 20,
              fontFamily: 'Inter-Bold',
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              // TODO - GO BACK TO TOP
              height: 45,
              width: 125,
              child: ElevatedButton(
                child: CustomText(
                  label: '\$${product.price.toStringAsFixed(2)}',
                  color: primaryColor,
                  fontFamily: 'Inter-Bold',
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shadowColor: primaryColor.withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  primary: primaryColor.withOpacity(0.3),
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 45,
              height: 45,
              decoration: const BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 6,
                      right: 2,
                    ),
                    child: LikeButtonWidget(
                      size: 28,
                      product: product,
                      icon: Icons.favorite_border,
                      secondIcon: Icons.favorite,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
