import 'package:email_validator/email_validator.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_store_app/blocs/bloc/auth_bloc.dart';
import 'package:fruit_store_app/styles/color_theme.dart';
import 'package:fruit_store_app/views/register_page/bloc/password_visibility_bloc.dart';
import 'package:fruit_store_app/widgets/custom_button.dart';
import 'package:fruit_store_app/widgets/custom_text.dart';
import 'package:fruit_store_app/widgets/custom_text_form_field.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  late final TextEditingController _controllerEmail;
  late final TextEditingController _controllerPassword;
  final _formKey = GlobalKey<FormState>();
  late AuthBloc _authBloc;
  late PasswordVisibilityBloc _passwordBloc;
  bool isObscureText = true;

  @override
  void initState() {
    _controllerEmail = TextEditingController();
    _controllerPassword = TextEditingController();
    _authBloc = BlocProvider.of<AuthBloc>(context);
    _passwordBloc = BlocProvider.of<PasswordVisibilityBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  void _createAccountWithEmailAndPassword(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _authBloc.add(
        SignUpRequested(
          _controllerEmail.text,
          _controllerPassword.text,
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
                label: 'Register',
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
                  return value != null && !EmailValidator.validate(value)
                      ? 'Enter a valid email'
                      : null;
                },
                hintText: 'Email',
                controller: _controllerEmail,
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<PasswordVisibilityBloc, PasswordVisibilityState>(
                bloc: _passwordBloc,
                builder: (context, state) {
                  return CustomTextFormField(
                    isPassword: true,
                    isObscureText: state.isObscureText,
                    hintText: 'Password',
                    controller: _controllerPassword,
                    validator: (value) {
                      return value != null && value.length < 6
                          ? "Enter min. 6 characters"
                          : null;
                    },
                    suffixIcon: InkWell(
                      onTap: () {
                        _passwordBloc.add(
                          ChangeVisibility(
                            !state.isObscureText,
                          ),
                        );
                      },
                      child: state.isObscureText
                          ? const Icon(FeatherIcons.eyeOff)
                          : const Icon(FeatherIcons.eye),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton.rounded(
                // add see password
                width: MediaQuery.of(context).size.width / 1.35,
                height: 50,
                label: 'Register',
                onPress: () => _createAccountWithEmailAndPassword(context),
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
