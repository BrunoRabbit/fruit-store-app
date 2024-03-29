import 'package:flutter/material.dart';
import 'package:fruit_store_app/app/widgets/app_custom_text.dart';

import 'package:fruit_store_app/styles/color_theme.dart';

enum CustomButtonType {
  circular,
  rounded,
}

class AppCustomButton extends FloatingActionButton {
  final String label;
  final double? textSize;
  final VoidCallback onPress;
  final double? width;
  final double? height;
  final double borderRadius;
  @override
  final Widget? child;
  final CustomButtonType type;
  @override
  final Object? heroTag;
  final Color btnColor;

  const AppCustomButton.circular({
    Key? key,
    this.label = '',
    required this.onPress,
    this.type = CustomButtonType.circular,
    this.heroTag,
    this.textSize = 14,
    this.borderRadius = 20,
    this.width = 180,
    this.height = 40,
    this.btnColor = primaryColor,
    this.child,
  }) : super.small(
          onPressed: onPress,
          child: child,
          key: key,
        );
  const AppCustomButton.rounded({
    Key? key,
    required this.label,
    required this.onPress,
    this.type = CustomButtonType.rounded,
    this.heroTag,
    this.textSize = 16,
    this.width = 180,
    this.borderRadius = 20,
    this.height = 40,
    this.child,
    this.btnColor = primaryColor,
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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                shadowColor: Colors.transparent,
                elevation: 0,
                primary: btnColor,
              ),
              child: AppCustomText(
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
            backgroundColor: btnColor,
          );
  }
}
