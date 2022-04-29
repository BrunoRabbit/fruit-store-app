import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_store_app/models/product.dart';
import 'package:fruit_store_app/styles/color_theme.dart';
import 'package:fruit_store_app/views/item_page/bloc/favorite/favorite_bloc.dart';
import 'package:fruit_store_app/widgets/custom_text.dart';
import 'package:like_button/like_button.dart';

class ItemPrice extends StatefulWidget {
  final Product product;
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
  late FavoriteBloc favoriteBloc;

  @override
  void initState() {
    favoriteBloc = BlocProvider.of<FavoriteBloc>(context);
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
              label: widget.product.name,
              size: 33,
              fontFamily: 'Inter-Bold',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomText(
              label: widget.subTitle,
              size: 18,
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
            SizedBox(
              // TODO - GO BACK TO TOP
              height: 45,
              width: 125,
              child: ElevatedButton(
                child: CustomText(
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
                    child: BlocBuilder<FavoriteBloc, FavoriteState>(
                      bloc: favoriteBloc,
                      builder: (context, state) {
                        return LikeButton(
                          size: 28,
                          onTap: (_) async {
                            return state.product[widget.product.id].isFavorite =
                                !state.product[widget.product.id].isFavorite;
                          },
                          isLiked: state.product[widget.product.id].isFavorite,
                          likeBuilder: (isLiked) {
                            Color color = isLiked ? primaryColor : Colors.grey;
                            return Icon(
                              isLiked ? Icons.favorite : Icons.favorite_border,
                              size: 28,
                              color: color,
                            );
                          },
                        );
                      },
                    ),
                    // LikeButtonWidget(

                    // size: 28,
                    // product: product,
                    // icon: Icons.favorite_border,
                    // secondIcon: Icons.favorite,
                    // ),
                    // if (state is ChangeFavoriteState) {
                    //   return LikeButtonWidget(
                    //     size: 28,
                    //     product: state.product,
                    //     icon: Icons.favorite_border,
                    //     secondIcon: Icons.favorite,
                    //   );
                    // }
                    // if (state is UnChangeFavoriteState) {
                    //   return LikeButtonWidget(
                    //     size: 28,
                    //     product: state.product,
                    //     icon: Icons.favorite_border,
                    //     secondIcon: Icons.favorite,
                    //   );
                    // }
                    // return const SnackBar(
                    //   content: CustomText(
                    //     label: 'Something went wrong!',
                    //   ),
                    // );
                  ),
                ),
              ),
              // );
            ),
          ],
        ),
      ),
    );
  }
}

// class FavoriteSingleton {
//   static final FavoriteSingleton _singleton = FavoriteSingleton._internal();
//    Product product = Product();

//   factory FavoriteSingleton() => _singleton;

//   FavoriteSingleton._internal() {
//     product;
//   }
// }
