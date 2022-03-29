import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_store_app/blocs/auth/auth_bloc.dart';
import 'package:fruit_store_app/routes/app_routes.dart';
import 'package:fruit_store_app/styles/color_theme.dart';
import 'package:fruit_store_app/views/home_page/home_page.dart';
import 'package:fruit_store_app/views/home_page/widgets/app_bar_widget.dart';
import 'package:fruit_store_app/views/register_page/widgets/register_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBarWidget(
      //   icon: Icons.arrow_back_rounded,
      //   isHomeScreen: false,
      // onPressed: () {
      //   Navigator.of(context).pop(
      //     RoutesPath.introductionPage,
      //   );
      // },
      // ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          }
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          }
          if (state is UnAuthenticated) {
            return const RegisterWidget();
          }
          return Container();
        },
      ),
    );
  }
}
