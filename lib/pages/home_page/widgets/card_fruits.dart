import 'package:flutter/material.dart';
import 'package:fruit_store_app/app/widgets/app_custom_text.dart';
import 'package:fruit_store_app/models/product.dart';
import 'package:fruit_store_app/routes/app_routes.dart';

class CardFruits extends StatelessWidget {
  final Product product;
  final double width;
  final double height;

  const CardFruits({
    Key? key,
    required this.product,
    this.width = 160,
    this.height = 200,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 25),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            RoutesPath.itemPage,
            arguments: product,
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: product.bgColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                top: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppCustomText(
                    label: product.name!,
                    size: 18,
                    fontFamily: 'Inter-Bold',
                  ),
                  AppCustomText(
                    label: '\$${product.price} each',
                    size: 14,
                    fontFamily: 'Inter-Bold',
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        product.image!,
                        height: 120,
                        width: 120,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      decoration: BoxDecoration(
                          color: product.bgColor,
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(20),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.add,
                          color: product.iconColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
