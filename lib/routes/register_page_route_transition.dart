import 'package:flutter/cupertino.dart';
import 'package:fruit_store_app/pages/register_page/register_page.dart';

class RegisterPageRouteTransition extends CupertinoPageRoute {
  RegisterPageRouteTransition()
      : super(builder: (context) => const RegisterPage());

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: const RegisterPage(),
    );
  }
}
