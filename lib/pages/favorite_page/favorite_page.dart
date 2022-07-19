import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_store_app/app/widgets/app_bar_widget.dart';
import 'package:fruit_store_app/app/widgets/app_custom_text.dart';
import 'package:fruit_store_app/controllers/product_controller.dart';
import 'package:fruit_store_app/models/product.dart';
import 'package:fruit_store_app/pages/favorite_page/widgets/favorite_card_widget.dart';
import 'package:fruit_store_app/styles/color_theme.dart';

import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<ProductController>(context);
    return Scaffold(
      appBar: const AppBarWidget(
        isHomeScreen: false,
        isNeedButton: false,
        title: 'My Favorites',
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10, left: 5),
            child: AppCustomText(
              label: 'Here you can see your favorites products',
              size: 19,
              fontFamily: 'Inter-SemiBold',
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 13,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 8,
                  );
                },
                itemBuilder: (context, index) {
                  return Container(
                    width: 18,
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
          const Spacer(),
          _controller.favoriteList.isEmpty
              ? Column(
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        './assets/svgs/heart_appreciation.svg',
                        height: 200,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const AppCustomText(
                      label: 'You have no favorites yet',
                      size: 22,
                      color: primaryColor,
                      fontFamily: 'Inter-SemiBold',
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: AppCustomText(
                        label:
                            'You can add one by clicking on heart button on product overview',
                        size: 18,
                        fontFamily: 'Inter-Medium',
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.width * 1.35,
                    child: ListView.builder(
                      itemCount: _controller.favoriteList.length,
                      itemBuilder: (context, index) {
                        Product product = _controller.favoriteList[index];

                        return FavoriteCardWidget(
                          product: product,
                        );
                      },
                    ),
                  ),
                ),
          const Spacer(),
        ],
      ),
    );
  }
}
