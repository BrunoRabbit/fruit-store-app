import 'package:flutter/material.dart';
import 'package:fruit_store_app/app/widgets/app_custom_text.dart';
import 'package:fruit_store_app/data/data.dart';
import 'package:fruit_store_app/models/product.dart';
import 'package:fruit_store_app/pages/home_page/widgets/card_fruits.dart';

class TopSell extends StatefulWidget {
  const TopSell({Key? key}) : super(key: key);

  @override
  State<TopSell> createState() => _TopSellState();
}

class _TopSellState extends State<TopSell> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const AppCustomText(
              fontFamily: 'Inter-Bold',
              label: 'Top Selling',
              size: 22,
            ),
            const Spacer(),
            TextButton(
              child: AppCustomText(
                fontFamily: 'Inter-Bold',
                label: 'See All',
                size: 15,
                color: Colors.black.withOpacity(0.5),
              ),
              onPressed: () {},
            ),
          ],
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: fruitsList.length,
            itemBuilder: (context, index) {
              Product product = fruitsList[index];
              return CardFruits(
                product: Product(
                  id: product.id,
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
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
