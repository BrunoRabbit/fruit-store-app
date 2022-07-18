import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_store_app/global_blocs/auth/auth_bloc.dart';
import 'package:fruit_store_app/app/widgets/app_bar_widget.dart';
import 'package:fruit_store_app/pages/home_page/widgets/top_sell.dart';
import 'package:fruit_store_app/pages/home_page/widgets/near_you.dart';
import 'package:fruit_store_app/pages/home_page/widgets/search_fruits.dart';
import 'package:fruit_store_app/pages/login_page/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBarWidget(
        icon: Icons.menu_rounded,
        onTap: () {
          Scaffold.of(context).openDrawer();
        },
        isHomeScreen: true,
      ),
      drawer: const Drawer(), // TODO - Implements Drawer
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
              (route) => false,
            );
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 35,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SearchFruits(),
                TopSell(),
                NearYou(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
