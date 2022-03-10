import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_store_app/routes/app_routes.dart';
import 'package:fruit_store_app/views/home_page/widgets/app_bar_widget.dart';
import 'package:fruit_store_app/widgets/custom_text.dart';
import 'package:fruit_store_app/widgets/custom_text_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  late final TextEditingController _controllerEmail;
  late final TextEditingController _controllerPassword;

  @override
  void initState() {
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
      body: Form(
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
              hintText: 'Email',
              controller: _controllerEmail,
            ),
            CustomTextFormField(
              hintText: 'Password',
              controller: _controllerPassword,
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
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
