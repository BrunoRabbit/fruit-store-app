import 'package:flutter/material.dart';
import 'package:fruit_store_app/views/welcome/step_one/step_one.dart';
import 'package:fruit_store_app/views/welcome/step_three/step_three.dart';
import 'package:fruit_store_app/views/welcome/step_two/step_two.dart';

class IntroductionController {
  List<Widget> listScreens = const [
    StepOne(),
    StepTwo(),
    StepThree(),

    // RegisterPage(),
    // LoginPage(),
  ];
}
