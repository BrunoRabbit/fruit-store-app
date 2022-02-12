import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String label;
  final double size;
  final String? fontFamily;
  final Color? color;
  final FontWeight? fontWeight;

  const CustomText({
    Key? key,
    required this.label,
    required this.size,
    this.fontFamily,
    this.color,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: size,
        fontFamily: fontFamily,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
