import 'package:flutter/material.dart';
import 'package:fruit_store_app/controllers/item_page_controller.dart';
import 'package:fruit_store_app/models/product.dart';
import 'package:fruit_store_app/views/item_page/widgets/item_description.dart';
import 'package:fruit_store_app/views/item_page/widgets/item_price.dart';

class ItemPage extends StatelessWidget {
  final Product? product;

  const ItemPage({
    Key? key,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = ItemPageController();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 18),
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(),
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    size: 26,
                  ),
                  onPressed: () {
                    _controller.reset(context);
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Image.asset(
                  product!.image,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
              ItemPrice(
                product: product!,
                subTitle: 'Sweet and Juicy',
              ),
              ItemDescription(
                product: product!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
