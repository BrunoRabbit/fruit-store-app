import 'package:badges/badges.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:fruit_store_app/app/widgets/app_custom_text.dart';
import 'package:fruit_store_app/controllers/product_controller.dart';
import 'package:fruit_store_app/data/data.dart';
import 'package:fruit_store_app/pages/cart_page/cart_page.dart';
import 'package:fruit_store_app/styles/color_theme.dart';
import 'package:provider/provider.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final IconData? icon;
  final VoidCallback onTap;
  final bool isHomeScreen;
  final bool isNeedContrast;
  final String? title;
  final bool? isImplyLeading;

  const AppBarWidget({
    Key? key,
    this.preferredSize = const Size.fromHeight(50.0),
    this.icon,
    required this.onTap,
    required this.isHomeScreen,
    this.isImplyLeading,
    this.title,
    this.isNeedContrast = false,
  }) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 98,
      leading: IconButton(
        icon: Icon(
          widget.icon,
          size: 33,
          color: widget.isNeedContrast ? Colors.white : Colors.black87,
        ),
        onPressed: widget.onTap,
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      ),
      actions: [
        widget.isHomeScreen
            ? Consumer<ProductController>(
                builder: (context, value, child) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 3, right: 12),
                    child: Badge(
                      badgeColor: primaryColor,
                      badgeContent: Text(cartList.length.toString()),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return const CartPage();
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
                  );
                },
              )
            : Container(),
      ],
      foregroundColor: Colors.black87,
      backgroundColor: Colors.transparent,
      shadowColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: widget.isImplyLeading ?? false,
      title: AppCustomText(
        label: widget.title ?? '',
        fontFamily: 'Inter-SemiBold',
        size: 18,
      ),
    );
  }
}
