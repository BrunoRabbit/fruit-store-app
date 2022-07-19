import 'package:flutter/material.dart';
import 'package:fruit_store_app/app/widgets/app_bar_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(
        title: 'Ajustes',
        isHomeScreen: false,
        isNeedButton: false,
      ),
    );
  }
}
