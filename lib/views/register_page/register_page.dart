import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_store_app/controllers/register_page_controller.dart';
import 'package:fruit_store_app/routes/app_routes.dart';
import 'package:fruit_store_app/views/home_page/widgets/app_bar_widget.dart';
import 'package:fruit_store_app/widgets/custom_text_form_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controllerReg = RegisterPageController();
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Sign Up',
            style: TextStyle(
              fontFamily: 'Inter-Bold',
              color: Colors.black87,
              fontSize: 28,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            hintText: 'Email',
            controller: _controllerReg.controllerEmail,
          ),
          CustomTextFormField(
            hintText: 'Password',
            controller: _controllerReg.controllerPassword,
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'or',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
            ),
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
    );
  }
}
