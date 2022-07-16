import 'package:flutter/material.dart';
import 'package:fruit_store_app/app/widgets/app_custom_button.dart';
import 'package:fruit_store_app/app/widgets/app_custom_text.dart';
import 'package:fruit_store_app/controllers/product_controller.dart';
import 'package:fruit_store_app/data/data.dart';
import 'package:fruit_store_app/models/product.dart';
import 'package:fruit_store_app/pages/cart_page/widgets/custom_app_bar_widget.dart';
import 'package:fruit_store_app/pages/cart_page/widgets/item_card_widget.dart';
import 'package:fruit_store_app/styles/color_theme.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<ProductController>(context);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: const CustomAppBarWidget(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 15, left: 30),
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
              height: 20,
            ),
            SizedBox(
              height: 4, // espessura dos fios cinzas
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 14,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 8,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      width: 18, // largura dos fios cinzas
                      decoration: ShapeDecoration(
                        color: Colors.black87.withOpacity(0.10),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 30),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    color: Colors.black87.withOpacity(0.7),
                    size: 24,
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
            const SizedBox(height: 10),
            cartList.isEmpty
                ? Center(
                    child: Stack(
                      children: [
                        Image.asset(
                          './assets/images/empty_cart.png',
                          height: 350,
                        ),
                        const Positioned(
                          bottom: 35,
                          left: 85,
                          child: AppCustomText(
                            label: 'Your cart is empty',
                            size: 20,
                            fontFamily: 'Inter-SemiBold',
                            color: primaryColor,
                          ),
                        ),
                        const Positioned(
                          bottom: 10,
                          left: 5,
                          child: AppCustomText(
                            label: 'You have no items in your shopping cart',
                            size: 18,
                            fontFamily: 'Inter-Medium',
                          ),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      height: (MediaQuery.of(context).size.height / 2),
                      child: ListView.builder(
                        itemCount: cartList.length,
                        itemBuilder: (context, index) {
                          Product product = cartList[index];

                          return ItemCardWidget(
                            product: product,
                            index: index,
                          );
                        },
                      ),
                    ),
                  ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 18,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const AppCustomText(
                    label: 'Total amount: ',
                    size: 22,
                    fontFamily: 'Inter-Bold',
                  ),
                  const Spacer(),
                  AppCustomText(
                    label: '\$${_controller.sum.toStringAsFixed(2)}',
                    fontFamily: 'Inter-SemiBold',
                    size: 22,
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              AppCustomButton.rounded(
                borderRadius: 6,
                width: double.infinity,
                label: 'Press me',
                onPress: () {},
                type: CustomButtonType.rounded,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
