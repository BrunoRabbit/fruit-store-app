import 'package:flutter/material.dart';

import 'package:fruit_store_app/styles/color_theme.dart';
import 'package:fruit_store_app/widgets/custom_text.dart';

enum CustomButtonType {
  circular,
  rounded,
}

class CustomButton extends FloatingActionButton {
  final String label;
  final double? textSize;
  final VoidCallback onPress;
  final double? width;
  final double? height;
  final Widget? child;
  final CustomButtonType type;
  Object? heroTag;

  CustomButton.circular({
    Key? key,
    this.label = '',
    required this.onPress,
    required this.type,
    this.textSize = 14,
    this.width = 180,
    this.height = 40,
    this.child,
  }) : super.small(
          onPressed: onPress,
          child: child,
          key: key,
        );
  CustomButton.rounded({
    Key? key,
    required this.label,
    required this.onPress,
    required this.type,
    this.textSize = 16,
    this.width = 180,
    this.height = 40,
    this.child,
  }) : super.small(
          onPressed: onPress,
          child: child,
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return type == CustomButtonType.rounded
        ? SizedBox(
            width: width,
            height: height,
            child: ElevatedButton(
              onPressed: onPress,
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.transparent,
                elevation: 0,
                primary: primaryColor,
              ),
              child: CustomText(
                label: label,
                size: textSize!,
                fontFamily: 'Inter-Bold',
              ),
            ),
          )
        : FloatingActionButton.small(
            onPressed: onPress,
            child: child,
            heroTag: heroTag,
            backgroundColor: primaryColor,
          );
  }
}
