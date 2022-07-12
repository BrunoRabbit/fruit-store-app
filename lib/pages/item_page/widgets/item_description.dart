import 'package:flutter/material.dart';
import 'package:fruit_store_app/app/widgets/app_custom_button.dart';
import 'package:fruit_store_app/app/widgets/app_custom_text.dart';
import 'package:fruit_store_app/pages/item_page/widgets/star_icon.dart';
import 'package:fruit_store_app/data/data.dart';
import 'package:fruit_store_app/models/product.dart';
import 'package:fruit_store_app/styles/color_theme.dart';

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
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.1),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
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
              child: AppCustomText(
                label: product!.name!,
                size: 20,
                fontFamily: 'Inter-Bold',
              ),
            ),
            Row(
              children: [
                Wrap(
                  children: List.generate(
                    5,
                    (index) => StarIcon(
                      isGoodRate: index > product!.rating! - 1 ? false : true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6, left: 8),
                  child: AppCustomText(
                    label: '${product!.rating}',
                    fontFamily: 'Inter-Bold',
                    size: 18,
                    richLabel: ' (42 reviews)',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: AppCustomText(
                label: 'Title...',
                fontFamily: 'Inter-Medium',
                size: 18,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const AppCustomText(
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
                AppCustomText(
                  label: '\$${product!.price}',
                  color: primaryColor,
                  size: 20,
                  fontFamily: 'Inter-Bold',
                ),
                const Spacer(),
                AppCustomButton.rounded(
                  type: CustomButtonType.rounded,
                  label: 'Add to cart',
                  onPress: () {
                    // fold para dobrar

                    fruitsList.add(product!);
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return CartPage(
                    //         product: product!,
                    //       );
                    //     },
                    //   ),
                    // );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
