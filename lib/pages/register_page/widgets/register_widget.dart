import 'package:email_validator/email_validator.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_store_app/app/widgets/app_custom_text.dart';
import 'package:fruit_store_app/app/widgets/app_custom_text_form_field.dart';
import 'package:fruit_store_app/controllers/welcome_page_controller.dart';
import 'package:fruit_store_app/global_blocs/auth/auth_bloc.dart';
import 'package:fruit_store_app/routes/app_routes.dart';
import 'package:fruit_store_app/pages/login_page/login_page.dart';
import 'package:provider/provider.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  late final TextEditingController _controllerEmail;
  late final TextEditingController _controllerPassword;
  late final TextEditingController _controllerUsername;
  final _formKey = GlobalKey<FormState>();
  late AuthBloc _authBloc;

  @override
  void initState() {
    _controllerUsername = TextEditingController();
    _controllerEmail = TextEditingController();
    _controllerPassword = TextEditingController();
    _authBloc = BlocProvider.of<AuthBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    _controllerUsername.dispose();
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  void _createAccountWithEmailAndPassword(context) {
    if (_formKey.currentState!.validate()) {
      _authBloc.add(
        SignUpRequested(
          _controllerEmail.text,
          _controllerPassword.text,
          _controllerUsername.text,
        ),
      );
    }
  }

  void _authenticateWithGoogle(context) {
    _authBloc.add(
      GoogleSignInRequested(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<WelcomePageController>(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: 710,
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(
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
                        label: "Sign up",
                        size: 30,
                        fontFamily: 'Inter-Bold',
                        color: Colors.orange,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const AppCustomText(
                        label: 'Register your account',
                        color: Colors.black54,
                        size: 20,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      AppCustomTextFormField(
                        isObscureText: false,
                        controller: _controllerUsername,
                        isNeedContrast: false,
                        hintText: 'Name',
                        validator: (value) {
                          return value!.isEmpty ? 'Name can\'t be null!' : null;
                        },
                        suffixIcon: const Icon(
                          FeatherIcons.user,
                          color: Colors.orange,
                        ),
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
                      AppCustomTextFormField(
                        isObscureText: _controller.isObscureText,
                        controller: _controllerPassword,
                        isNeedContrast: false,
                        hintText: 'Password',
                        validator: (value) {
                          return value != null && value.length < 6
                              ? "Enter min. 6 characters!"
                              : null;
                        },
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              _controller.isObscureText =
                                  !_controller.isObscureText;
                            });
                          },
                          child: _controller.isObscureText
                              ? const Icon(
                                  FeatherIcons.eyeOff,
                                  color: Colors.orange,
                                )
                              : const Icon(
                                  FeatherIcons.eye,
                                  color: Colors.orange,
                                ),
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
                              'Sign up',
                              style: TextStyle(
                                fontFamily: 'Inter-SemiBold',
                                fontSize: 16,
                              ),
                            ),
                            onPressed: () =>
                                _createAccountWithEmailAndPassword(context),
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
                            label: 'Continue with Google',
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
                          'Sign in',
                          style: TextStyle(
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
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
