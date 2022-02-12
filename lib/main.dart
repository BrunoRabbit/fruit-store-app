import 'package:flutter/material.dart';
import 'package:fruit_store_app/views/home_page/home_page.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

final themeData = ThemeData(
  fontFamily: 'Inter-Regular',
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: const HomePage(),
    );
  }
}
