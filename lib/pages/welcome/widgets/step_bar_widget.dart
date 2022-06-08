import 'package:flutter/material.dart';

class StepBarWidget extends StatelessWidget {
  final bool isCompleted;

  const StepBarWidget({
    Key? key,
    required this.isCompleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isCompleted ? 6 : 5,
      width: isCompleted ? 30 : 20,
      decoration: BoxDecoration(
        color: isCompleted ? Colors.black87 : Colors.grey[400],
        borderRadius: BorderRadius.circular(
          5,
        ),
      ),
    );
  }
}
