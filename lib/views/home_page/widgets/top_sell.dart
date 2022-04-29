import 'package:flutter/material.dart';
import 'package:fruit_store_app/controllers/home_page_controller.dart';
import 'package:fruit_store_app/models/product.dart';
import 'package:fruit_store_app/widgets/card_fruits.dart';
import 'package:fruit_store_app/widgets/custom_text.dart';

class TopSell extends StatelessWidget {
  const TopSell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = HomePageController();
    return Column(
      children: [
        Row(
          children: [
            const CustomText(
              fontFamily: 'Inter-Bold',
              label: 'Top Selling',
              size: 22,
            ),
            const Spacer(),
            TextButton(
              child: CustomText(
                fontFamily: 'Inter-Bold',
                label: 'See All',
                size: 15,
                color: Colors.black.withOpacity(0.5),
              ),
              onPressed: () {},
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              _controller.fruitsList.length,
              (index) {
                Product product = _controller.fruitsList[index];
                return CardFruits(
                  product: Product(
                    id: product.id,
                    // qtdd: product.qtdd,
                    name: product.name,
                    price: product.price,
                    bgColor: product.bgColor,
                    image: product.image,
                    iconColor: product.iconColor,
                    rating: product.rating,
                    isFavorite: product.isFavorite,
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
