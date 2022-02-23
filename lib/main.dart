import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'routes/app_routes.dart';
import 'views/welcome_page/bloc/cubit/progress_bar_cubit.dart';

import 'views/welcome_page/welcome_screen.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProgressBarCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: themeData,
        home: const WelcomeScreen(), //splash
        routes: AppRoutes.path,
      ),
    );
  }
}
