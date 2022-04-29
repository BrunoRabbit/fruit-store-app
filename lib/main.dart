import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_store_app/global_blocs/auth/auth_bloc.dart';
import 'package:fruit_store_app/global_blocs/cart/cart_bloc.dart';
import 'package:fruit_store_app/global_blocs/catalog/catalog_bloc.dart';
import 'package:fruit_store_app/repositories/auth_repository.dart';
import 'package:fruit_store_app/repositories/shopping_repository.dart';
import 'package:fruit_store_app/views/home_page/home_page.dart';
import 'package:fruit_store_app/views/item_page/bloc/favorite/favorite_bloc.dart';
import 'package:fruit_store_app/views/register_page/pass_visibility/password_visibility_bloc.dart';
import 'package:fruit_store_app/views/welcome/step_one/bloc/progress_bar_bloc.dart';
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
  late PasswordVisibilityBloc passwordVisibilityBloc;
  late FavoriteBloc favoriteBloc;

  @override
  void initState() {
    favoriteBloc = FavoriteBloc();
    passwordVisibilityBloc = PasswordVisibilityBloc();
    progressBarBloc = ProgressBarBloc();
    super.initState();
  }

  @override
  void dispose() {
    favoriteBloc.close();
    progressBarBloc.close();
    passwordVisibilityBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      // create: (context) => AuthRepository(),
      providers: [
        RepositoryProvider<AuthRepository>(
            create: (context) => AuthRepository()),
        RepositoryProvider<ShoppingRepository>(
            create: (context) => ShoppingRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
              authRepository: RepositoryProvider.of<AuthRepository>(context),
            ),
          ),
          BlocProvider<CatalogBloc>(
            create: (context) => CatalogBloc(
              shoppingRepository:
                  RepositoryProvider.of<ShoppingRepository>(context),
            )..add(CatalogStarted()),
          ),
          BlocProvider<CartBloc>(
            create: (context) => CartBloc(
              shoppingRepository:
                  RepositoryProvider.of<ShoppingRepository>(context),
            )..add(CartStarted()),
          ),
          BlocProvider<FavoriteBloc>(
            create: (context) => favoriteBloc,
          ),
          BlocProvider<ProgressBarBloc>(
            create: (context) => progressBarBloc,
          ),
          BlocProvider<PasswordVisibilityBloc>(
            create: (context) => passwordVisibilityBloc,
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: themeData,
          home: const HomePage(),
          routes: AppRoutes.path,
        ),
      ),
    );
  }
}
