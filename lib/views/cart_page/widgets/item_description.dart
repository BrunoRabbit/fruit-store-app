import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:fruit_store_app/controllers/item_page_controller.dart';
import 'package:fruit_store_app/models/product.dart';
import 'package:fruit_store_app/styles/color_theme.dart';
import 'package:fruit_store_app/views/cart_page/bloc/cubit/rating_cubit.dart';
import 'package:fruit_store_app/widgets/card_fruits.dart';
import 'package:fruit_store_app/widgets/custom_button.dart';
import 'package:fruit_store_app/widgets/custom_text.dart';
import 'package:fruit_store_app/widgets/star_icon.dart';

class ItemDescription extends StatelessWidget {
  final Product? product;

  const ItemDescription({
    Key? key,
    required this.product,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: primaryColor.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Container(
              height: 4,
              width: 80,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                label: product!.name,
                size: 20,
                fontFamily: 'Inter-Bold',
              ),
            ),
            Row(
              children: [
                RatingBar.builder(
                  itemSize: 28,
                  glow: false,
                  allowHalfRating: true,
                  itemBuilder: (context, index) {
                    return const StarIcon();
                  },
                  onRatingUpdate: (value) {
                    BlocProvider.of<RatingCubit>(context).addRating(value);
                  },
                  updateOnDrag: true,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6, left: 8),
                  child: BlocBuilder<RatingCubit, RatingState>(
                    builder: (context, state) {
                      return CustomText(
                        label: '${state.rating}', //TODO - FIX changing screens
                        fontFamily: 'Inter-Bold',
                        size: 18,
                        richLabel: ' (42 reviews)',
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                label: 'Title...',
                fontFamily: 'Inter-Medium',
                size: 18,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const CustomText(
              label:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
              fontFamily: 'Inter-Medium',
              textOverflow: TextOverflow.ellipsis,
              color: Colors.black54,
              size: 14,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                CustomText(
                  label: '\$${product!.price}',
                  color: primaryColor,
                  size: 20,
                  fontFamily: 'Inter-Bold',
                ),
                const Spacer(),
                CustomButton(
                  label: 'Add to cart',
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
