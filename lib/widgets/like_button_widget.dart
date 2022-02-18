import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import 'package:fruit_store_app/styles/color_theme.dart';

class LikeButtonWidget extends StatelessWidget {
  final bool isLike;
  final double size;
  final IconData icon;
  final IconData secondIcon;

  const LikeButtonWidget({
    Key? key,
    required this.isLike,
    this.size = 30,
    required this.icon,
    required this.secondIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LikeButton(
      size: size,
      isLiked: isLike,
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
