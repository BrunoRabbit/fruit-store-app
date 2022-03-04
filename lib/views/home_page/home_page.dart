import 'package:flutter/material.dart';
import 'package:fruit_store_app/views/home_page/widgets/app_bar_widget.dart';
import 'package:fruit_store_app/views/home_page/widgets/top_sell.dart';
import 'package:fruit_store_app/views/home_page/widgets/near_you.dart';
import 'package:fruit_store_app/views/home_page/widgets/search_fruits.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        icon: Icons.menu_rounded,
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        isHomeScreen: false,
      ),
      drawer: const Drawer(), // TODO - Implements Drawer
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 35,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SearchFruits(),
              TopSell(),
              NearYou(),
            ],
          ),
        ),
      ),
    );
  }
}
