import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_store_app/app/widgets/app_custom_button.dart';
import 'package:fruit_store_app/app/widgets/app_custom_text.dart';
import 'package:fruit_store_app/controllers/welcome_page_controller.dart';
import 'package:fruit_store_app/routes/login_page_route_transition.dart';
import 'package:fruit_store_app/routes/register_page_route_transition.dart';
import 'package:fruit_store_app/app/widgets/app_bar_widget.dart';
import 'package:provider/provider.dart';

class StepThree extends StatefulWidget {
  const StepThree({Key? key}) : super(key: key);

  @override
  State<StepThree> createState() => _StepThreeState();
}

class _StepThreeState extends State<StepThree> {
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<WelcomePageController>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        isHomeScreen: false,
        isNeedButton: true,
        icon: Icons.arrow_back_rounded,
        onTap: () {
          _controller.previousPage();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 28,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 250,
              child: SvgPicture.asset(
                'assets/svgs/congrats.svg',
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const SizedBox(
              width: double.infinity,
              child: AppCustomText(
                label: 'Almost there!',
                color: Colors.black87,
                fontFamily: 'Inter-Bold',
                size: 32,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const AppCustomText(
              label:
                  'You\'re almost done, complete your registration (if you don\'t already have one), or login below',
              color: Colors.black87,
              fontFamily: 'Inter-Medium',
              size: 18,
            ),
            const SizedBox(
              height: 25,
            ),
            AppCustomButton.rounded(
              label: 'Login',
              onPress: () {
                Navigator.of(context).push(
                  LoginPageRouteTransition(),
                );
              },
              type: CustomButtonType.rounded,
            ),
            const SizedBox(
              height: 15,
            ),
            const AppCustomText(
              label: 'or',
              color: Colors.black54,
              size: 16,
            ),
            const SizedBox(
              height: 15,
            ),
            AppCustomButton.rounded(
              label: 'Register',
              type: CustomButtonType.rounded,
              onPress: () {
                Navigator.of(context).push(
                  RegisterPageRouteTransition(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
