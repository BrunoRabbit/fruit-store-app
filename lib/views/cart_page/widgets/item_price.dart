import 'package:flutter/material.dart';

import 'package:fruit_store_app/controllers/cart_page_controller.dart';
import 'package:fruit_store_app/styles/color_theme.dart';
import 'package:fruit_store_app/widgets/card_fruits.dart';
import 'package:fruit_store_app/widgets/custom_text.dart';
import 'package:fruit_store_app/widgets/like_button_widget.dart';

class ItemPrice extends StatelessWidget {
  final CardFruits fruits;
  final String subTitle;

  const ItemPrice({
    Key? key,
    required this.fruits,
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
              label: fruits.name,
              size: 28,
              fontFamily: 'Inter-Bold',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomText(
              label: subTitle,
              size: 16,
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
              height: 45,
              width: 125,
              child: ElevatedButton(
                child: CustomText(
                  label: '\$${fruits.price}',
                  color: primaryColor,
                  fontFamily: 'Inter-Bold',
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  primary: primaryColor.withOpacity(0.2),
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
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
                      child: const Padding(
                        padding: EdgeInsets.only(
                          left: 6,
                          right: 2,
                        ),
                        child: LikeButtonWidget(
                          size: 28,
                          isLike: false,
                          icon: Icons.favorite_border,
                          secondIcon: Icons.favorite,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 100,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent,
                      elevation: 0,
                      primary: primaryColor,
                    ),
                    child: const CustomText(
                      label: 'New',
                      fontFamily: 'Inter-Bold',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}