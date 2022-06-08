import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_store_app/app/widgets/app_custom_text.dart';
import 'package:fruit_store_app/models/product.dart';
import 'package:fruit_store_app/styles/color_theme.dart';
import 'package:fruit_store_app/pages/item_page/bloc/favorite/favorite_bloc.dart';
import 'package:like_button/like_button.dart';

class ItemPrice extends StatefulWidget {
  final Product product;

  const ItemPrice({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ItemPrice> createState() => _ItemPriceState();
}

class _ItemPriceState extends State<ItemPrice> {
  late FavoriteBloc _favoriteBloc;

  @override
  void initState() {
    _favoriteBloc = BlocProvider.of<FavoriteBloc>(context);
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
            AppCustomText(
              label: widget.product.name,
              size: 33,
              fontFamily: 'Inter-Bold',
            ),
            const SizedBox(
              height: 10,
            ),
            const AppCustomText(
              label: 'Sweet and Juicy',
              size: 18,
              color: Colors.black54,
              fontFamily: 'Inter-Medium',
            ),
            const SizedBox(
              height: 15,
            ),
            const AppCustomText(
              label: 'Price',
              size: 20,
              fontFamily: 'Inter-Bold',
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              // TODO - GO BACK TO TOP
              height: 45,
              width: 125,
              child: ElevatedButton(
                child: AppCustomText(
                  label: '\$${widget.product.price.toStringAsFixed(2)}',
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
            const SizedBox(
              height: 20,
            ),
            // BlocBuilder<FavoriteBloc, FavoriteState>(
            //   bloc: _favoriteBloc,
            //   builder: (context, state) {
            //     return
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
                    child: LikeButton(
                      size: 28,
                      onTap: (_) async {
                        widget.product.isFavorite = !widget.product.isFavorite;

                        print(widget.product.isFavorite);

                        _favoriteBloc.add(
                          FavoriteItem(
                            product: widget.product,
                            newFavorite: widget.product.isFavorite,
                            // newFavorite: state
                            //     .productList[widget.product.id].isFavorite,
                          ),
                        );
                        return null;
                      },
                      isLiked: widget.product.isFavorite,
                      // isLiked:
                      //     state.productList[widget.product.id].isFavorite,
                      likeBuilder: (isLiked) {
                        Color color = isLiked ? primaryColor : Colors.grey;
                        return Icon(
                          isLiked ? Icons.favorite : Icons.favorite_border,
                          size: 28,
                          color: color,
                        );
                      },
                    ),
                  ),
                ),
              ),
              //   );
              // },
            ),
          ],
        ),
      ),
    );
  }
}
/**
 *  // IconButton(
                            //   onPressed: () {
                            //     // Color color = isLiked ? primaryColor : Colors.grey;
                            //     widget.product.isFavorite =
                            //         !widget.product.isFavorite;

                            //     print(widget.product.id);
                            //     print(widget.product.isFavorite);

                            //     _favoriteBloc.add(
                            //       FavoriteItem(
                            //         product: widget.product,
                            //         newFavorite: widget.product.isFavorite,
                            //         // newFavorite: state
                            //         //     .productList[widget.product.id].isFavorite,
                            //       ),
                            //     );
                            //   },
                            //   icon: Icon(
                            //     widget.product.isFavorite
                            //         ? Icons.favorite
                            //         : Icons.favorite_border,
                            //     size: 28,
                            //     color: Colors.amber,
                            //   ),
 */
