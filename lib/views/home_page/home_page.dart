import 'package:flutter/material.dart';
import 'package:fruit_store_app/views/home_page/widgets/app_bar_widget.dart';
import 'package:fruit_store_app/views/home_page/widgets/more_sell.dart';
import 'package:fruit_store_app/views/home_page/widgets/near_you.dart';
import 'package:fruit_store_app/views/home_page/widgets/search_fruits.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      drawer: const Drawer(), // TODO - Implements Drawer
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 35,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(
                height: 20,
              ),
              SearchFruits(),
              SizedBox(
                height: 20,
              ),
              MoreSell(),
              SizedBox(
                height: 20,
              ),
              NearYou(),
            ],
          ),
        ),
      ),
    );
  }
}
