import 'package:flutter/material.dart';
import 'package:fruit_store_app/styles/color_theme.dart';

class StarIcon extends StatelessWidget {
  const StarIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.star_rate_rounded,
      color: primaryColor,
    );
  }
}
