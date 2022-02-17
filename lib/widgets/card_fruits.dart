import 'package:flutter/material.dart';

import 'package:fruit_store_app/styles/color_theme.dart';
import 'package:fruit_store_app/widgets/custom_text.dart';

class CardFruits extends StatelessWidget {
  final String name;
  final double price;
  final Color bgColor;
  final String image;
  final Color iconColor;
  final VoidCallback onTap;

  const CardFruits({
    Key? key,
    required this.name,
    required this.price,
    required this.bgColor,
    required this.image,
    required this.iconColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 25),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 150,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: bgColor,
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
                  label: name,
                  size: 18,
                  fontFamily: 'Inter-Bold',
                ),
                CustomText(
                  label: '\$$price each',
                  size: 14,
                  fontFamily: 'Inter-Bold',
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      image,
                      height: 120,
                      width: 120,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(20),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.add,
                        color: iconColor,
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
