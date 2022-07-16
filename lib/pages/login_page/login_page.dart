import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_store_app/global_blocs/auth/auth_bloc.dart';
import 'package:fruit_store_app/pages/home_page/home_page.dart';
import 'package:fruit_store_app/styles/color_theme.dart';
import 'package:fruit_store_app/pages/login_page/widgets/login_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      // appBar: AppBarWidget(
      //   icon: Icons.arrow_back_rounded,
      //   isHomeScreen: false,
      //   onPressed: () {
      //     Navigator.of(context).pop(
      //       RoutesPath.introductionPage,
      //     );
      //   },
      // ),
      body: BlocListener<AuthBloc, AuthState>(
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
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthLoading) {
              // Showing the loading indicator while the user is signing in
              return const Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              );
            }
            if (state is UnAuthenticated) {
              return const LoginWidget();
            }
            return Container();
          },
        ),
      ),
    );
  }
}
