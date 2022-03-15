import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_store_app/blocs/bloc/auth_bloc.dart';
import 'package:fruit_store_app/routes/app_routes.dart';
import 'package:fruit_store_app/styles/color_theme.dart';
import 'package:fruit_store_app/views/home_page/home_page.dart';
import 'package:fruit_store_app/views/home_page/widgets/app_bar_widget.dart';
import 'package:fruit_store_app/widgets/custom_button.dart';
import 'package:fruit_store_app/widgets/custom_text.dart';
import 'package:fruit_store_app/widgets/custom_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _controllerEmail;
  late final TextEditingController _controllerPassword;
  final _formKey = GlobalKey<FormState>();
  late AuthBloc _authBloc;

  @override
  void initState() {
    _authBloc = BlocProvider.of<AuthBloc>(context);
    _controllerEmail = TextEditingController();
    _controllerPassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  void _authenticateWithEmailAndPassword(BuildContext context) {
    // If email is valid adding new Event [SignInRequested].
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        SignInRequested(_controllerEmail.text, _controllerPassword.text),
      );
    }
  }

  void _authenticateWithGoogle(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(
      GoogleSignInRequested(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        icon: Icons.arrow_back_rounded,
        isHomeScreen: false,
        onPressed: () {
          Navigator.of(context).pop(
            RoutesPath.introductionPage,
          );
        },
      ),
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
              return Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const CustomText(
                        label: 'Login',
                        fontFamily: 'Inter-Bold',
                        color: Colors.black,
                        size: 28,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 4,
                        width: 60,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        isObscureText: false,
                        validator: (value) {
                          return value != null &&
                                  !EmailValidator.validate(value)
                              ? 'Enter a valid email'
                              : null;
                        },
                        hintText: 'Email',
                        controller: _controllerEmail,
                      ),
                      CustomTextFormField(
                        isObscureText: true,
                        validator: (value) {
                          return value != null && value.length < 6
                              ? "Enter min. 6 characters"
                              : null;
                        },
                        hintText: 'Password',
                        controller: _controllerPassword,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton.rounded(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 50,
                        label: 'Login',
                        onPress: () {
                          _authenticateWithEmailAndPassword(context);
                        },
                        type: CustomButtonType.rounded,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomText(
                        label: 'or',
                        color: Colors.black54,
                        size: 16,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 50,
                        child: ElevatedButton.icon(
                          icon: SvgPicture.asset(
                            'assets/svgs/google-logo.svg',
                          ),
                          label: const Text(
                            'Continue with Google',
                            style: TextStyle(
                              color: Colors.black87,
                              fontFamily: 'Inter-Bold',
                              fontSize: 18,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                              side: const BorderSide(
                                color: Colors.black87,
                                width: 3,
                              ),
                            ),
                          ),
                          onPressed: () {
                            _authenticateWithGoogle(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
