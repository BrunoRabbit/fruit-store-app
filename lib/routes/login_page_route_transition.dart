import 'package:flutter/cupertino.dart';
import 'package:fruit_store_app/pages/login_page/login_page.dart';

class LoginPageRouteTransition extends CupertinoPageRoute {
  LoginPageRouteTransition() : super(builder: (context) => const LoginPage());

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: const LoginPage(),
    );
  }
}
