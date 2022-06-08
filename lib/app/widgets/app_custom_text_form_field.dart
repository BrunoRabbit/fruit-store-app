import 'package:flutter/material.dart';

import 'package:fruit_store_app/styles/color_theme.dart';

class AppCustomTextFormField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isNeedContrast;
  final String? Function(String?)? validator;
  final bool isObscureText;
  final bool isPassword;
  final Widget? suffixIcon;
  final Iterable<String>? autofillHints;

  const AppCustomTextFormField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.isNeedContrast = false,
    this.validator,
    required this.isObscureText,
    this.isPassword = false,
    this.suffixIcon,
    this.autofillHints,
  }) : super(key: key);

  @override
  State<AppCustomTextFormField> createState() => _AppCustomTextFormFieldState();
}

class _AppCustomTextFormFieldState extends State<AppCustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 32,
        right: 32,
        top: 15,
      ),
      child: TextFormField(
        obscureText: widget.isObscureText,
        controller: widget.controller,
        validator: widget.validator,
        cursorColor: widget.isNeedContrast ? Colors.white : Colors.black54,
        autofillHints: widget.autofillHints,
        decoration: InputDecoration(
          errorStyle: const TextStyle(
            fontFamily: 'Inter-Medium',
            fontSize: 12,
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: widget.isNeedContrast ? Colors.white : Colors.black54,
          ),
          suffixIcon: widget.suffixIcon,
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.isNeedContrast ? Colors.white : Colors.red,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.isNeedContrast ? Colors.white : Colors.red,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.isNeedContrast ? Colors.white : Colors.black54,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: primaryColor,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
