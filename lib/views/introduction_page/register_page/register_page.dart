import 'package:flutter/material.dart';
import 'package:fruit_store_app/views/home_page/widgets/app_bar_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        icon: Icons.arrow_back_rounded,
        onPressed: () {},
        isHomeScreen: false,
      ),
      body: Column(
        children: [
          TextFormField(),
          TextFormField(),
        ],
      ),
    );
  }
}
