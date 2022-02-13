import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_store_app/controllers/cart_page_controller.dart';
import 'package:fruit_store_app/styles/color_theme.dart';

import 'package:fruit_store_app/widgets/card_fruits.dart';
import 'package:fruit_store_app/widgets/custom_text.dart';
import 'package:fruit_store_app/widgets/star_icon.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  final CardFruits fruits;

  const CartPage({
    Key? key,
    required this.fruits,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(CartPageController());

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                fruits.image,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
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
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 300,
              width: double.infinity,
              color: primaryColor.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      height: 4,
                      width: 80,
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: CustomText(
                            label: fruits.name,
                            size: 20,
                            fontFamily: 'Inter-Bold',
                          ),
                        ),
                        const Spacer(),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: primaryColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Container(
                              width: 35,
                              height: 35,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                './assets/images/like.png',
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        StarIcon(),
                        StarIcon(),
                        StarIcon(),
                        StarIcon(),
                        StarIcon(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
