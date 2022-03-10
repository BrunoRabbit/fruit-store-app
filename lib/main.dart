import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_store_app/views/item_page/bloc/price_bloc.dart';
import 'package:fruit_store_app/views/welcome/step_one/bloc/progress_bar_bloc.dart';
import 'package:fruit_store_app/views/welcome/welcome_page.dart';
import 'routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
  late ProgressBarBloc progressBarBloc;
  late PriceBloc priceBloc;

  @override
  void initState() {
    super.initState();
    priceBloc = PriceBloc();
    progressBarBloc = ProgressBarBloc();
  }

  @override
  void dispose() {
    priceBloc.close();
    progressBarBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProgressBarBloc>(
          create: (context) => ProgressBarBloc(),
        ),
        BlocProvider<PriceBloc>(
          create: (context) => PriceBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: themeData,

        home: const WelcomePage(), //splash
        routes: AppRoutes.path,
      ),
    );
  }
}
