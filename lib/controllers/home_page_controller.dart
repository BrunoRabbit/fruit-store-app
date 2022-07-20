import 'package:flutter/cupertino.dart';
import 'package:fruit_store_app/controllers/product_controller.dart';
import 'package:fruit_store_app/pages/cart_page/cart_page.dart';
import 'package:fruit_store_app/pages/favorite_page/favorite_page.dart';
import 'package:fruit_store_app/pages/home_page/home_page.dart';
import 'package:provider/provider.dart';

class HomePageController extends ChangeNotifier {
  int currentIndex = 0;
  final PageController pageController = PageController();

  List<Widget> listPages = const [
    HomePage(),
    FavoritePage(),
    CartPage(),
  ];

  changeNavIndex(
      int index, PageController pageController, BuildContext context) async {
    currentIndex = index;
    await isCartPage(context);
    pageController.jumpToPage(currentIndex);
    notifyListeners();
  }

  isCartPage(BuildContext context) {
    final _productController =
        Provider.of<ProductController>(context, listen: false);
    if (listPages[currentIndex] == listPages.elementAt(2)) {
      _productController.isFromNavbar = false;
    } else {
      _productController.isFromNavbar = true;
    }
    notifyListeners();
  }
}
