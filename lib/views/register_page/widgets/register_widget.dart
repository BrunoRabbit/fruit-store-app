import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_store_app/blocs/bloc/auth_bloc.dart';
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
  // late GoogleAuthBloc googleBloc;

  @override
  void initState() {
    _controllerEmail = TextEditingController();
    _controllerPassword = TextEditingController();
    // googleBloc = BlocProvider.of<GoogleAuthBloc>(context);
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
      BlocProvider.of<AuthBloc>(context).add(
        SignUpRequested(
          _controllerEmail.text,
          _controllerPassword.text,
        ),
      );
    }
  }

  void _authenticateWithGoogle(context) {
    BlocProvider.of<AuthBloc>(context).add(
      GoogleSignInRequested(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomText(
            label: 'Sign Up',
            fontFamily: 'Inter-Bold',
            color: Colors.black,
            size: 28,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            isObscureText: false,
            hintText: 'Email',
            controller: _controllerEmail,
          ),
          CustomTextFormField(
            isObscureText: true,
            hintText: 'Password',
            controller: _controllerPassword,
          ),
          const SizedBox(
            height: 15,
          ),
          CustomButton.rounded(
            label: 'Register now',
            onPress: () {
              _createAccountWithEmailAndPassword(context);
            },
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
            width: MediaQuery.of(context).size.width / 1.2,
            height: 50,
            child: ElevatedButton.icon(
              icon: SvgPicture.asset('assets/svgs/google-logo.svg'),
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
          // },
          // ),
        ],
      ),
    );
  }
}
