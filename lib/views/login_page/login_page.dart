import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_store_app/routes/app_routes.dart';
import 'package:fruit_store_app/views/home_page/widgets/app_bar_widget.dart';
import 'package:fruit_store_app/views/welcome/step_one/bloc/progress_bar_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        icon: Icons.arrow_back_rounded,
        isHomeScreen: false,
        onPressed: () {
          Navigator.of(context).pop(
            RoutesPath.introductionPage,
          );
        },
      ),
      body: Container(),
    );
  }
}
