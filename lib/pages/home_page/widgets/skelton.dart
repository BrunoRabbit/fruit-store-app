import 'package:flutter/material.dart';

class Skelton extends StatelessWidget {
  final double? height, width;

  const Skelton({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.06),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
    );
  }
}
