import 'package:flutter/material.dart';
import 'package:fruit_store_app/app/widgets/app_custom_text.dart';
import 'package:fruit_store_app/data/data.dart';
import 'package:fruit_store_app/pages/home_page/widgets/card_near.dart';

class NearYou extends StatelessWidget {
  const NearYou({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppCustomText(
          label: 'Near You',
          fontFamily: 'Inter-Bold',
          size: 22,
        ),
        TextButton(
          child: AppCustomText(
            fontFamily: 'Inter-Bold',
            label: '28+ shops',
            size: 15,
            color: Colors.black.withOpacity(0.5),
          ),
          onPressed: () {},
        ),
        const SizedBox(
          height: 15,
        ),
        Column(
          children: List.generate(
            listCardNear.length,
            (index) {
              return CardNear(
                title: listCardNear[index].title,
                image: listCardNear[index].image,
                hours: listCardNear[index].hours,
                stars: listCardNear[index].stars,
                distance: listCardNear[index].distance,
              );
            },
          ),
        ),
      ],
    );
  }
}
