import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_store_app/app/widgets/app_bar_widget.dart';
import 'package:fruit_store_app/global_blocs/auth/auth_bloc.dart';
import 'package:fruit_store_app/pages/home_page/widgets/shimmer_widgets/skelton.dart';
import 'package:fruit_store_app/pages/login_page/login_page.dart';

class AgroupedSkelton extends StatefulWidget {
  const AgroupedSkelton({Key? key}) : super(key: key);

  @override
  State<AgroupedSkelton> createState() => _AgroupedSkeltonState();
}

class _AgroupedSkeltonState extends State<AgroupedSkelton> {
  @override
  void initState() {
    // WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
    //   await Future.delayed(const Duration(seconds: 1));
    //   Navigator.of(context).pushNamed(RoutesPath.homePage);
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        onTap: () {},
        isHomeScreen: false,
      ),
      drawer: const Drawer(),
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
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Skelton(
                  width: 220,
                  height: 30,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Skelton(
                  width: 250,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Skelton(
                  height: 45,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    Skelton(
                      width: 135,
                      height: 25,
                    ),
                    Spacer(),
                    Skelton(
                      width: 80,
                      height: 25,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 180,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 25,
                      );
                    },
                    itemBuilder: (context, index) {
                      return const Skelton(
                        width: 160,
                        height: 220,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Skelton(
                  width: 135,
                  height: 25,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Skelton(
                  width: 80,
                  height: 25,
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    const Skelton(
                      width: 120,
                      height: 120,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: const [
                        Skelton(
                          width: 120,
                          height: 20,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Skelton(
                          width: 120,
                          height: 20,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Skelton(
                          width: 120,
                          height: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
