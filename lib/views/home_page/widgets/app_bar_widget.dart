import 'package:badges/badges.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:fruit_store_app/controllers/home_page_controller.dart';
import 'package:fruit_store_app/views/cart_page/cart_page.dart';
import 'package:fruit_store_app/views/home_page/home_page.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final IconData icon;
  final VoidCallback onPressed;
  final bool isHomeScreen;
  final bool isNeedContrast;

  const AppBarWidget({
    Key? key,
    this.preferredSize = const Size.fromHeight(50.0),
    required this.icon,
    required this.onPressed,
    required this.isHomeScreen,
    this.isNeedContrast = false,
  }) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    final HomePageController _homePageController = HomePageController();

    return AppBar(
      leadingWidth: 98,
      leading: IconButton(
        icon: Icon(
          widget.icon,
          size: 33,
          color: widget.isNeedContrast ? Colors.white : Colors.black87,
        ),
        onPressed: widget.onPressed,
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      ),
      actions: [
        widget.isHomeScreen
            ? Padding(
                padding: const EdgeInsets.only(top: 3, right: 12),
                child: Badge(
                  badgeContent: Text(
                    _homePageController.fruitsList.length.toString(),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return CartPage();
                          },
                        ),
                      );
                    },
                    icon: const Icon(
                      FeatherIcons.shoppingCart,
                      size: 30,
                    ),
                  ),
                ),
              )
            : Container(),
      ],
      foregroundColor: Colors.black,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}
