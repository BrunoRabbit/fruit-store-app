import 'package:flutter/material.dart';

import 'package:fruit_store_app/pages/welcome/widgets/step_bar_widget.dart';

class StepBarSection extends StatelessWidget {
  final int currentIndex;
  const StepBarSection({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StepBarWidget(
          isCompleted: currentIndex == 0,
        ),
        const SizedBox(
          width: 10,
        ),
        StepBarWidget(
          isCompleted: currentIndex == 1,
        ),
        const SizedBox(
          width: 10,
        ),
        StepBarWidget(
          isCompleted: currentIndex == 2,
        ),
      ],
    );
  }
}
