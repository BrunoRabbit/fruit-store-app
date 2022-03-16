import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_store_app/blocs/bloc/auth_bloc.dart';
import 'package:fruit_store_app/data/repositories/auth_repository.dart';
import 'package:fruit_store_app/views/item_page/bloc/price_bloc.dart';
import 'package:fruit_store_app/views/register_page/bloc/password_visibility_bloc.dart';
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
  late PasswordVisibilityBloc passwordVisibilityBloc;

  @override
  void initState() {
    super.initState();
    passwordVisibilityBloc = PasswordVisibilityBloc();
    priceBloc = PriceBloc();
    progressBarBloc = ProgressBarBloc();
  }

  @override
  void dispose() {
    priceBloc.close();
    progressBarBloc.close();
    passwordVisibilityBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // `To access the AuthRepository in the UI
    // we need to wrap the MaterialApp around RepositoryProvider.`

    // `To access the States and Events of the bloc
    // we need to wrap the MaterialApp around BlocProvider.`
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
              authRepository: RepositoryProvider.of<AuthRepository>(context),
            ),
          ),
          BlocProvider<ProgressBarBloc>(
            create: (context) => ProgressBarBloc(),
          ),
          BlocProvider<PriceBloc>(
            create: (context) => PriceBloc(),
          ),
          BlocProvider<PasswordVisibilityBloc>(
            create: (context) => PasswordVisibilityBloc(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: themeData,

          home: const WelcomePage(), //welcome
          routes: AppRoutes.path,
        ),
      ),
    );
  }
}
