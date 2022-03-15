import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_store_app/routes/login_page_route_transition.dart';
import 'package:fruit_store_app/routes/register_page_route_transition.dart';
import 'package:fruit_store_app/views/home_page/widgets/app_bar_widget.dart';
import 'package:fruit_store_app/views/register_page/register_page.dart';
import 'package:fruit_store_app/views/welcome/step_one/bloc/progress_bar_bloc.dart';
import 'package:fruit_store_app/widgets/custom_button.dart';
import 'package:fruit_store_app/widgets/custom_text.dart';

class StepThree extends StatefulWidget {
  const StepThree({Key? key}) : super(key: key);

  @override
  State<StepThree> createState() => _StepThreeState();
}

class _StepThreeState extends State<StepThree> {
  late ProgressBarBloc progressBarBloc;

  @override
  void initState() {
    progressBarBloc = BlocProvider.of<ProgressBarBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarWidget(
        isHomeScreen: false,
        icon: Icons.arrow_back_rounded,
        onPressed: () {
          progressBarBloc.add(ChangeStepBarEvent(1));
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 28,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 240,
              child: SvgPicture.asset(
                'assets/svgs/congrats.svg',
              ),
            ),
            // StorySet
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              width: double.infinity,
              child: CustomText(
                label: 'Almost there!',
                color: Colors.black87,
                fontFamily: 'Inter-Bold',
                size: 32,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const CustomText(
              label:
                  'You\'re almost done, complete your registration (if you don\'t already have one), or login below',
              color: Colors.black87,
              fontFamily: 'Inter-Medium',
              size: 18,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton.rounded(
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
            const CustomText(
              label: 'or',
              color: Colors.black54,
              size: 16,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButton.rounded(
              label: 'Register',
              type: CustomButtonType.rounded,
              onPress: () {
                Navigator.of(context).push(
                  RegisterPageRouteTransition(),
                );
              },
            ),
            // TODO - SHIMMER LOADING ANIMATION
          ],
        ),
      ),
    );
  }
}
