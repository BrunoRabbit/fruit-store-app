import 'package:flutter/material.dart';
import 'package:fruit_store_app/styles/color_theme.dart';
import 'package:fruit_store_app/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final double textSize;
  final VoidCallback onPressed;
  final double width;
  final double height;

  const CustomButton({
    Key? key,
    required this.label,
    this.textSize = 16,
    required this.onPressed,
    this.width = 180,
    this.height = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          elevation: 0,
          primary: primaryColor,
        ),
        child: CustomText(
          label: label,
          size: textSize,
          fontFamily: 'Inter-Bold',
        ),
      ),
    );
  }
}
