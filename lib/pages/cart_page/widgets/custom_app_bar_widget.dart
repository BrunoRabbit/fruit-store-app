import 'package:flutter/material.dart';
import 'package:fruit_store_app/app/widgets/app_custom_text.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const CustomAppBarWidget({
    Key? key,
    this.preferredSize = const Size.fromHeight(50.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      foregroundColor: Colors.black87,
      backgroundColor: Colors.transparent,
      shadowColor: Colors.white,
      centerTitle: true,
      title: const AppCustomText(
        label: 'Add to your cart',
        fontFamily: 'Inter-SemiBold',
        size: 18,
      ),
    );
  }
}
