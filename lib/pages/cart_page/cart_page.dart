import 'package:flutter/material.dart';
import 'package:fruit_store_app/app/widgets/app_custom_text.dart';
import 'package:fruit_store_app/data/data.dart';
import 'package:fruit_store_app/models/product.dart';
import 'package:fruit_store_app/pages/cart_page/widgets/custom_app_bar_widget.dart';
import 'package:fruit_store_app/pages/cart_page/widgets/item_card_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 30, left: 30),
              child: AppCustomText(
                label: 'Fruits and vegetables',
                fontFamily: 'Inter-Bold',
                size: 22,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 30),
              child: AppCustomText(
                label: 'Seasonal',
                fontFamily: 'Inter-SemiBold',
                size: 20,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 15,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemBuilder: (context, index) {
                  return Container(
                    height: 10,
                    width: 10,
                    color: Colors.red,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 30),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    color: Colors.black87.withOpacity(0.7),
                    size: 22,
                  ),
                  const SizedBox(width: 5),
                  AppCustomText(
                    label: 'You can swipe an item to remove it',
                    fontFamily: 'Inter-Medium',
                    size: 18,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 1.05,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: cartList.length,
                        itemBuilder: (context, index) {
                          Product product = fruitsList[index];
                          return ItemCardWidget(product: product);
                        },
                      ),
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
