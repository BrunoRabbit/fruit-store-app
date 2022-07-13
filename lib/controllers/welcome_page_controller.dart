import 'package:flutter/material.dart';
import 'package:fruit_store_app/pages/welcome/step_one/step_one.dart';
import 'package:fruit_store_app/pages/welcome/step_three/step_three.dart';
import 'package:fruit_store_app/pages/welcome/step_two/step_two.dart';

class WelcomePageController extends ChangeNotifier {
  int stepIndex = 0;
  bool isObscureText = true;

  List<Widget> listScreens = const [
    StepOne(),
    StepTwo(),
    StepThree(),
  ];

  nextPage() {
    stepIndex++;
    notifyListeners();
  }

  previousPage() {
    stepIndex--;
    notifyListeners();
  }
}
