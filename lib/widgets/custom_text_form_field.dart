import 'package:flutter/material.dart';

import 'package:fruit_store_app/styles/color_theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isNeedContrast;

  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.isNeedContrast = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 32,
        right: 32,
        top: 15,
      ),
      child: TextFormField(
        controller: controller,
        cursorColor: isNeedContrast ? Colors.white : Colors.black87,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: isNeedContrast ? Colors.white : Colors.black54,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: isNeedContrast ? Colors.white : Colors.black87,
              width: 3.0,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: primaryColor,
              width: 3.0,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
