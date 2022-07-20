import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:fruit_store_app/controllers/home_page_controller.dart';
import 'package:fruit_store_app/controllers/product_controller.dart';
import 'package:fruit_store_app/styles/color_theme.dart';
import 'package:provider/provider.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    final _homeController = Provider.of<HomePageController>(context);
    final _productController = Provider.of<ProductController>(context);
    return Scaffold(
      body: PageView(
        controller: _homeController.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _homeController.listPages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        onTap: (index) async {
          await _homeController.changeNavIndex(
            index,
            _homeController.pageController,
            context,
          );
        },
        currentIndex: _homeController.currentIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.black.withOpacity(0.2),
        unselectedLabelStyle: const TextStyle(
          fontFamily: 'Inter-Medium',
        ),
        selectedLabelStyle: const TextStyle(
          fontSize: 15,
          fontFamily: 'Inter-Medium',
        ),
        items: [
          const BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Favorites',
            icon: _productController.favoriteList.isNotEmpty
                ? _homeController.listPages[_homeController.currentIndex] ==
                        _homeController.listPages.elementAt(1)
                    ? Badge(
                        badgeColor: Colors.red,
                        badgeContent: Text(
                          _productController.favoriteList.length.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        child: const Icon(Icons.favorite),
                      )
                    : const Icon(Icons.favorite)
                : const Icon(Icons.favorite),
          ),
          const BottomNavigationBarItem(
            label: 'Cart',
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
    );
  }
}
