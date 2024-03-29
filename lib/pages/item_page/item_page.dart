import 'package:flutter/material.dart';
import 'package:fruit_store_app/models/product.dart';
import 'package:fruit_store_app/routes/app_routes.dart';
import 'package:fruit_store_app/app/widgets/app_bar_widget.dart';
import 'package:fruit_store_app/pages/item_page/widgets/item_description.dart';
import 'package:fruit_store_app/pages/item_page/widgets/item_price.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context)?.settings.arguments as Product;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBarWidget(
        icon: Icons.arrow_back_rounded,
        isNeedButton: true,
        onTap: () {
          Navigator.pop(
            context,
            RoutesPath.kHomePage,
          );
        },
        isHomeScreen: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.asset(
                  product.image!,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
              ItemPrice(
                product: product,
              ),
              ItemDescription(
                product: product,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
