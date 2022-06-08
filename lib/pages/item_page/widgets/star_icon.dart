import 'package:flutter/material.dart';

import 'package:fruit_store_app/styles/color_theme.dart';

class StarIcon extends StatelessWidget {
  final bool isGoodRate;

  const StarIcon({
    Key? key,
    this.isGoodRate = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star_rate_rounded,
      color: isGoodRate ? primaryColor : Colors.grey,
    );
  }
}
