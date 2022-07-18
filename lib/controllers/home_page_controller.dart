import 'package:flutter/cupertino.dart';
import 'package:fruit_store_app/pages/cart_page/cart_page.dart';
import 'package:fruit_store_app/pages/favorite_page/favorite_page.dart';
import 'package:fruit_store_app/pages/home_page/home_page.dart';
import 'package:fruit_store_app/pages/profile_page/profile_page.dart';

class HomePageController extends ChangeNotifier {
  int currentIndex = 0;
  List<Widget> listPages = [
    const HomePage(),
    const FavoritePage(),
    const CartPage(),
    const ProfilePage(),
  ];

  changeNavIndex(int index, PageController pageController) {
    currentIndex = index;
    pageController.jumpToPage(currentIndex);
    notifyListeners();
  }
}
