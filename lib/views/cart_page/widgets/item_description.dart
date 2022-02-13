import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_store_app/controllers/cart_page_controller.dart';
import 'package:fruit_store_app/styles/color_theme.dart';

import 'package:fruit_store_app/widgets/card_fruits.dart';
import 'package:fruit_store_app/widgets/custom_text.dart';
import 'package:get/get.dart';

class ItemDescription extends StatelessWidget {
  final CardFruits fruits;

  const ItemDescription({
    Key? key,
    required this.fruits,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(CartPageController());
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20),
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
            const CustomText(
              label: 'Sweet and Juicy',
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
                Obx(
                  () => Container(
                    width: 43,
                    height: 43,
                    decoration: const BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          _controller.isFavorite.value =
                              !_controller.isFavorite.value;
                        },
                        child: SvgPicture.asset(
                          _controller.isFavorite.value
                              ? './assets/svgs/heart-full.svg'
                              : './assets/svgs/heart-empty.svg',
                          color: Colors.white,
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
