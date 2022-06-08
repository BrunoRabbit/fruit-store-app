import 'package:flutter/material.dart';
import 'package:fruit_store_app/app/widgets/app_custom_text.dart';

import 'package:fruit_store_app/models/product.dart';

class ItemCard extends StatefulWidget {
  final Product product;
  final double width;
  final double height;

  const ItemCard({
    Key? key,
    required this.product,
    this.width = 180,
    this.height = 250,
  }) : super(key: key);

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25),
      child: Card(
        color: Colors.grey[800], // Work as elevation
        elevation: 5,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[200],
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TODO - IMPLEMENTS CORRECTLY
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      widget.product.image,
                      height: 120,
                      width: 120,
                    ),
                  ),
                ),
                // BlocBuilder<FavoriteBloc, FavoriteState>(
                //   bloc: favoriteBloc,
                //   builder: (context, state) {
                //     print(state.product);
                //     return Padding(
                //       padding: const EdgeInsets.only(right: 10),
                //       child: Row(
                //         children: [
                //           CustomText(
                //             label: state.product[widget.product.id].name,
                //             size: 18,
                //             fontFamily: 'Inter-Bold',
                //           ),
                //           const Spacer(),
                //           state.product[widget.product.id].isFavorite
                //               ? const Icon(Icons.favorite)
                //               : const Icon(Icons.favorite_border),
                //         ],
                //       ),
                //     );
                //   },
                // ),
                AppCustomText(
                  label: '\$${widget.product.price} each',
                  size: 15,
                  fontFamily: 'Inter-SemiBold',
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    decoration: BoxDecoration(
                        color: widget.product.bgColor,
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(20),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.add,
                        color: widget.product.iconColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
