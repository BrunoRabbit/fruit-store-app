import 'package:flutter/material.dart';
import 'package:fruit_store_app/controllers/home_page_controller.dart';
import 'package:fruit_store_app/views/cart_page/cart_page.dart';
import 'package:fruit_store_app/widgets/card_fruits.dart';
import 'package:fruit_store_app/widgets/custom_text.dart';
import 'package:get/get.dart';

class MoreSell extends StatelessWidget {
  const MoreSell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(HomePageController());
    return Column(
      children: [
        Row(
          children: [
            const CustomText(
              fontFamily: 'Inter-Bold',
              label: 'Mais vendidos',
              size: 22,
            ),
            const Spacer(),
            TextButton(
              child: CustomText(
                fontFamily: 'Inter-Bold',
                label: 'Veja mais',
                size: 15,
                color: Colors.black.withOpacity(0.5),
              ),
              onPressed: () {},
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Obx(
            () => Row(
              children: List.generate(
                _controller.fruitsList.length,
                (index) {
                  return CardFruits(
                    name: _controller.fruitsList[index].name,
                    price: _controller.fruitsList[index].price,
                    bgColor: _controller.fruitsList[index].bgColor,
                    image: _controller.fruitsList[index].image,
                    iconColor: _controller.fruitsList[index].iconColor,
                    onTap: () {
                      Get.to(() => CartPage(
                            fruits: _controller.fruitsList[index],
                          ));
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
