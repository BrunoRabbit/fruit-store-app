import 'package:flutter/material.dart';
import 'package:fruit_store_app/app/widgets/app_bar_widget.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        isHomeScreen: false,
        onTap: () {},
        title: 'My Favorites',
      ),
      body: Container(),
    );
  }
}
