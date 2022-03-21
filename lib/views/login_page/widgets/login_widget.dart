import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fruit_store_app/blocs/bloc/auth_bloc.dart';
import 'package:fruit_store_app/styles/color_theme.dart';
import 'package:fruit_store_app/widgets/custom_button.dart';
import 'package:fruit_store_app/widgets/custom_text.dart';
import 'package:fruit_store_app/widgets/custom_text_form_field.dart';

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
    // If email is valid adding new Event [SignInRequested].
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
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Card(
          elevation: 10,
          shadowColor: Colors.black.withOpacity(0.6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
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
                autofillHints: const [AutofillHints.email],
                validator: (value) {
                  return value != null && !EmailValidator.validate(value)
                      ? 'Enter a valid email'
                      : null;
                },
                hintText: 'Email',
                controller: _controllerEmail,
              ),
              CustomTextFormField(
                isObscureText: true,
                autofillHints: const [AutofillHints.password],
                validator: (value) {
                  return value != null && value.length < 6
                      ? "Enter min. 6 characters"
                      : null;
                },
                hintText: 'Password',
                controller: _controllerPassword,
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: CustomText(
                    label: 'Forgot password?',
                    fontFamily: 'Inter-Medium',
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton.rounded(
                width: MediaQuery.of(context).size.width / 1.35,
                height: 50,
                label: 'Login',
                onPress: () => _authenticateWithEmailAndPassword(context),
                type: CustomButtonType.rounded,
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomText(
                label: 'or',
                color: Colors.black54,
                size: 16,
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.35,
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
                        color: Colors.black54,
                        width: 2,
                      ),
                    ),
                  ),
                  onPressed: () => _authenticateWithGoogle(context),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
