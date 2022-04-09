import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_store_app/global_blocs/cart/cart_bloc.dart';

import 'package:fruit_store_app/models/product.dart';
import 'package:fruit_store_app/styles/color_theme.dart';
import 'package:fruit_store_app/widgets/custom_text.dart';

class CatalogListItem extends StatelessWidget {
  final Product product;

  const CatalogListItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(
                aspectRatio: 1, child: ColoredBox(color: product.bgColor)),
            const SizedBox(width: 24),
            Expanded(
                child: CustomText(
              label: product.name,
            )),
            const SizedBox(width: 24),
            BlocBuilder<CartBloc, CartState>(
              builder: ((context, state) {
                if (state is CartLoading) {
                  return const CircularProgressIndicator(color: primaryColor);
                }
                if (state is CartLoaded) {
                  final isCart = state.cartModel.products.contains(product);

                  return ElevatedButton.icon(
                    label: const Text(''),
                    icon: const Icon(Icons.add_outlined),
                    onPressed: () {},
                  );
                }
                return Container();
              }),
            ),
          ],
        ),
      ),
    );
  }
}
