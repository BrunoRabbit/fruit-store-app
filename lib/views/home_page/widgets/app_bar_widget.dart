import 'package:badges/badges.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final IconData icon;
  final VoidCallback onPressed;
  final bool isHomeScreen;

  const AppBarWidget({
    Key? key,
    this.preferredSize = const Size.fromHeight(50.0),
    required this.icon,
    required this.onPressed,
    required this.isHomeScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 98,
      leading: IconButton(
        icon: Icon(
          icon,
          size: 35,
          color: Colors.black87,
        ),
        onPressed: onPressed,
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      ),
      actions: [
        isHomeScreen
            ? Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Badge(
                  padding: const EdgeInsets.only(
                    top: 2,
                    bottom: 8,
                    left: 15,
                  ),
                  badgeContent: const Text(
                    '2',
                  ),
                  child: IconButton(
                    onPressed: () {},
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
