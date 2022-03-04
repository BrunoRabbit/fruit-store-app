import 'package:flutter/material.dart';

import '../views/introduction_page/login_page/login_page.dart';
import '../views/introduction_page/register_page/register_page.dart';
import '../views/introduction_page/welcome_page/welcome_screen.dart';

class IntroductionController {
  PageController pageController = PageController(
    initialPage: 0,
  );
  List<Widget> listScreens = const [
    WelcomeScreen(),
    RegisterPage(),
    LoginPage(),
  ];
}
