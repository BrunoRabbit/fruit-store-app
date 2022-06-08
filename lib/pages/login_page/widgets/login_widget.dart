import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fruit_store_app/app/widgets/app_custom_text.dart';
import 'package:fruit_store_app/app/widgets/app_custom_text_form_field.dart';
import 'package:fruit_store_app/global_blocs/auth/auth_bloc.dart';
import 'package:fruit_store_app/routes/app_routes.dart';
import 'package:fruit_store_app/styles/color_theme.dart';
import 'package:fruit_store_app/pages/register_page/register_page.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
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
    if (_formKey.currentState!.validate()) {
      _authBloc.add(
        SignInRequested(_controllerEmail.text, _controllerPassword.text),
      );
    }
  }

  void _authenticateWithGoogle(BuildContext context) {
    _authBloc.add(
      GoogleSignInRequested(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: 650,
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 8,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back_rounded,
                              size: 33,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop(
                                RoutesPath.introductionPage,
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const AppCustomText(
                        label: "Sign in",
                        size: 30,
                        fontFamily: 'Inter-Bold',
                        color: primaryColor,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const AppCustomText(
                        label: 'Welcome back',
                        color: Colors.black54,
                        size: 20,
                        fontFamily: 'Inter-Medium',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      AppCustomTextFormField(
                        isObscureText: false,
                        controller: _controllerEmail,
                        isNeedContrast: false,
                        hintText: 'E-mail',
                        validator: (value) {
                          return value != null &&
                                  !EmailValidator.validate(value)
                              ? 'Invalid e-mail!'
                              : null;
                        },
                        suffixIcon: const Icon(
                          Icons.email_outlined,
                          color: Colors.orange,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AppCustomTextFormField(
                        isObscureText: true,
                        controller: _controllerPassword,
                        isNeedContrast: false,
                        hintText: 'Password',
                        validator: (value) {
                          return value != null && value.length < 6
                              ? "Enter min. 6 characters!"
                              : null;
                        },
                        suffixIcon: const Icon(
                          FeatherIcons.lock,
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1.40,
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.deepOrangeAccent,
                            ),
                            child: const Text(
                              'Sign in',
                              style: TextStyle(
                                fontFamily: 'Inter-SemiBold',
                                fontSize: 16,
                              ),
                            ),
                            onPressed: () =>
                                _authenticateWithEmailAndPassword(context),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'or',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontFamily: 'Inter-Medium',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.40,
                        height: 50,
                        child: ElevatedButton.icon(
                          icon: SvgPicture.asset(
                            './assets/svgs/google-logo.svg',
                          ),
                          label: const AppCustomText(
                            label: 'Sign in with Google',
                            color: Colors.black87,
                            size: 18,
                            fontFamily: 'Inter-Medium',
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey[100],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          onPressed: () => _authenticateWithGoogle(context),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AppCustomText(
                        label: 'Already have an account?',
                        color: Colors.black87.withOpacity(0.5),
                        size: 16,
                      ),
                      TextButton(
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const RegisterPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
