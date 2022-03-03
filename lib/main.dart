import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_store_app/views/introduction_page/introduction_page.dart';
import 'package:fruit_store_app/views/introduction_page/welcome_page/bloc/cubit/progress_bar_cubit.dart';
import 'package:fruit_store_app/views/item_page/bloc/price_bloc.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

final themeData = ThemeData(
  fontFamily: 'Inter-Regular',
);

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late PriceBloc priceBloc;
  late ProgressBarCubit progressBarCubit;

  @override
  void initState() {
    priceBloc = PriceBloc();
    progressBarCubit = ProgressBarCubit();
    super.initState();
  }

  @override
  void dispose() {
    priceBloc = PriceBloc();
    progressBarCubit = ProgressBarCubit();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProgressBarCubit>(
          create: (context) => ProgressBarCubit(),
        ),
        BlocProvider<PriceBloc>(
          create: (context) => PriceBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: themeData,
        home: const IntroductionPage(), //splash
        routes: AppRoutes.path,
      ),
    );
  }
}
