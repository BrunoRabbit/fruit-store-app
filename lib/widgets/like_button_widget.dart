import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import 'package:fruit_store_app/models/product.dart';
import 'package:fruit_store_app/styles/color_theme.dart';

class LikeButtonWidget extends StatelessWidget {
  final double size;
  final IconData icon;
  final IconData secondIcon;
  final Product product;

  const LikeButtonWidget({
    Key? key,
    this.size = 30,
    required this.icon,
    required this.secondIcon,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LikeButton(
      size: size,
      onTap: (_) async {
        return product.isFavorite = !product.isFavorite;
      },
      isLiked: product.isFavorite,
      likeBuilder: (isLiked) {
        Color color = isLiked ? primaryColor : Colors.grey;
        return Icon(
          isLiked ? secondIcon : icon,
          size: size,
          color: color,
        );
      },
    );
  }
}
