import 'package:flutter/material.dart';

import 'package:fruit_store_app/styles/color_theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isNeedContrast;
  final String? Function(String?)? validator;
  final bool isObscureText;

  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.isNeedContrast = false,
    this.validator,
    required this.isObscureText,
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
        obscureText: isObscureText,
        controller: controller,
        validator: validator,
        cursorColor: isNeedContrast ? Colors.white : Colors.black87,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: isNeedContrast ? Colors.white : Colors.black54,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: isNeedContrast ? Colors.white : Colors.red,
              width: 3.0,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: isNeedContrast ? Colors.white : Colors.red,
              width: 3.0,
            ),
            borderRadius: BorderRadius.circular(8),
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
