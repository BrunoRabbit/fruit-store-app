import 'package:flutter/material.dart';

class AppCustomText extends StatelessWidget {
  final String label;
  final String? richLabel;
  final double size;
  final String? fontFamily;
  final Color? color;
  final FontWeight? fontWeight;
  final TextOverflow? textOverflow;

  const AppCustomText({
    Key? key,
    required this.label,
    this.richLabel,
    this.size = 14,
    this.fontFamily,
    this.color,
    this.fontWeight,
    this.textOverflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: label,
        style: TextStyle(
          fontSize: size,
          fontFamily: fontFamily,
          color: color,
          fontWeight: fontWeight,
          overflow: textOverflow,
        ),
        children: [
          TextSpan(
            text: richLabel,
            style: const TextStyle(
              fontFamily: 'Inter-Medium',
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
