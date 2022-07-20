import 'package:flutter/material.dart';
import 'package:fruit_store_app/app/widgets/app_custom_text.dart';
import 'package:fruit_store_app/controllers/home_page_controller.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<HomePageController>(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: AppCustomText(
                label: 'Order your favorites fruits',
                size: 22,
                fontFamily: 'Inter-Medium',
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  './assets/images/logo.png',
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          ListTile(
            leading: const Icon(Icons.home_rounded),
            title: const AppCustomText(
              label: 'Home',
              size: 16,
              fontFamily: 'Inter-Medium',
            ),
            onTap: () {
              _controller.changeNavIndex(
                0,
                _controller.pageController,
                context,
              );
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 5,
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const AppCustomText(
              label: 'Favorite',
              size: 16,
              fontFamily: 'Inter-Medium',
            ),
            onTap: () {
              _controller.changeNavIndex(
                1,
                _controller.pageController,
                context,
              );
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 5,
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const AppCustomText(
              label: 'Your cart',
              size: 16,
              fontFamily: 'Inter-Medium',
            ),
            onTap: () {
              _controller.changeNavIndex(
                2,
                _controller.pageController,
                context,
              );
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
