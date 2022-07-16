import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_store_app/controllers/product_controller.dart';
import 'package:fruit_store_app/controllers/welcome_page_controller.dart';
import 'package:fruit_store_app/global_blocs/auth/auth_bloc.dart';
import 'package:fruit_store_app/pages/home_page/widgets/shimmer_widgets/agrouped_skelton.dart';
import 'package:fruit_store_app/repositories/auth_repository.dart';
import 'package:provider/provider.dart';
import 'routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

final themeData = ThemeData(
  fontFamily: 'Inter-Regular',
  scaffoldBackgroundColor: Colors.grey[200],
);

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => AuthBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context),
        ),
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider<WelcomePageController>(
              create: (context) => WelcomePageController(),
            ),
            ChangeNotifierProvider<ProductController>(
              create: (context) => ProductController(),
            ),
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: themeData,
            home: const AgroupedSkelton(), // WelcomePage
            routes: AppRoutes.path,
          ),
        ),
      ),
    );
  }
}
