import 'package:flutter/material.dart';
import 'package:fruit_store_app/controllers/home_page_controller.dart';
import 'package:fruit_store_app/widgets/card_near.dart';
import 'package:fruit_store_app/widgets/custom_text.dart';
import 'package:get/get.dart';

class NearYou extends StatelessWidget {
  const NearYou({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(HomePageController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          label: 'Próximo de você',
          fontFamily: 'Inter-Bold',
          size: 22,
        ),
        TextButton(
          child: CustomText(
            fontFamily: 'Inter-Bold',
            label: '+28 Lojas',
            size: 15,
            color: Colors.black.withOpacity(0.5),
          ),
          onPressed: () {},
        ),
        const SizedBox(
          height: 15,
        ),
        Obx(
          () => Column(
            children: List.generate(
              _controller.listCardNear.length,
              (index) {
                return CardNear(
                  title: _controller.listCardNear[index].title,
                  image: _controller.listCardNear[index].image,
                  hours: _controller.listCardNear[index].hours,
                  stars: _controller.listCardNear[index].stars,
                  distance: _controller.listCardNear[index].distance,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
