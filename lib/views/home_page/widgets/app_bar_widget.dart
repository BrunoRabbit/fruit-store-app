import 'package:badges/badges.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const AppBarWidget({
    Key? key,
    this.preferredSize = const Size.fromHeight(50.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 98,
      leading: IconButton(
        icon: const Icon(
          Icons.menu_rounded,
          color: Colors.black,
          size: 35,
        ),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Badge(
            padding: const EdgeInsets.only(
              top: 2,
              bottom: 8,
              left: 15,
            ),
            badgeContent: Text(
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
        ),
        // IconButton(
        //   onPressed: () {},
        //   icon: const Icon(
        //     FeatherIcons.shoppingCart,
        //     color: Colors.black,
        //     size: 30,
        //   ),
        // ),
      ],
      foregroundColor: Colors.black,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}
