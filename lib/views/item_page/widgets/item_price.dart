import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fruit_store_app/models/product.dart';
import 'package:fruit_store_app/styles/color_theme.dart';
import 'package:fruit_store_app/views/item_page/bloc/price_bloc.dart';
import 'package:fruit_store_app/widgets/custom_button.dart';
import 'package:fruit_store_app/widgets/custom_text.dart';
import 'package:fruit_store_app/widgets/like_button_widget.dart';

class ItemPrice extends StatefulWidget {
  final Product? product;
  final String subTitle;

  const ItemPrice({
    Key? key,
    required this.product,
    required this.subTitle,
  }) : super(key: key);

  @override
  State<ItemPrice> createState() => _ItemPriceState();
}

class _ItemPriceState extends State<ItemPrice> {
  late PriceBloc priceBloc;

  @override
  void initState() {
    priceBloc = BlocProvider.of<PriceBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              label: widget.product!.name,
              size: 28,
              fontFamily: 'Inter-Bold',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomText(
              label: widget.subTitle,
              size: 16,
              color: Colors.black54,
              fontFamily: 'Inter-Medium',
            ),
            const SizedBox(
              height: 15,
            ),
            const CustomText(
              label: 'Price',
              size: 20,
              fontFamily: 'Inter-Bold',
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<PriceBloc, PriceState>(
              bloc: priceBloc,
              builder: (context, state) {
                return Row(
                  children: [
                    SizedBox(
                      height: 45,
                      width: 125,
                      child: ElevatedButton(
                        child: CustomText(
                          label: '\$${state.product[state.index].price}',
                          color: primaryColor,
                          fontFamily: 'Inter-Bold',
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shadowColor: primaryColor.withOpacity(0.1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          primary: primaryColor.withOpacity(0.3),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const Spacer(),
                    CustomButton.circular(
                      child: const Icon(Icons.remove_outlined),
                      type: CustomButtonType.circular,
                      onPress: () {
                        Product? newProduct = widget.product;
                        if (newProduct!.price >= newProduct.price) {
                          if (state.index > 0) {
                            newProduct.price -= newProduct.price;
                            priceBloc.add(
                              ChangePrice(
                                newProduct,
                                state.index - 1,
                              ),
                            );
                          }
                        }

                        print(state.index);
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CustomButton.circular(
                      type: CustomButtonType.circular,
                      child: const Icon(FeatherIcons.plus),
                      onPress: () {
                        Product? newProduct = widget.product;
                        if (newProduct!.price <= newProduct.price) {
                          newProduct.price += newProduct.price;
                          priceBloc.add(
                            ChangePrice(
                              newProduct,
                              state.index + 1,
                            ),
                          );
                        }
                        print(newProduct.price);
                      },
                    ),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 45,
              height: 45,
              decoration: const BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 6,
                      right: 2,
                    ),
                    child: LikeButtonWidget(
                      size: 28,
                      product: widget.product!,
                      icon: Icons.favorite_border,
                      secondIcon: Icons.favorite,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
