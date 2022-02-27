import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_store_app/routes/app_routes.dart';
import 'package:fruit_store_app/views/welcome_page/bloc/cubit/progress_bar_cubit.dart';
import '../../styles/default_styles.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import 'widgets/step_bar_widget.dart';
import 'bloc/cubit/progress_bar_cubit.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Positioned(
              right: -90,
              top: -90,
              child: SizedBox(
                height: 320,
                child: Image.asset(
                  './assets/images/welcome-fruits.png',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: SizedBox(
                      height: 300,
                      child: Image.asset(
                        './assets/images/logo.png',
                      ),
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(
                    height: 75,
                    width: double.infinity,
                    child: CustomText(
                      label: 'Order your \nfavorites fruits',
                      fontFamily: 'Inter-Bold',
                      size: 32,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const SizedBox(
                    width: double.infinity,
                    child: CustomText(
                      label: 'Eat fresh fruits and try to be healthy',
                      size: 20,
                      fontFamily: 'Inter-Medium',
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: defaultPadding * 1.8,
                    ),
                    child: BlocConsumer<ProgressBarCubit, ProgressBarState>(
                      listener: (context, state) {
                        if (state.currentIndex == 3) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Carregando!'),
                              duration: Duration(seconds: 4),
                            ),
                          );
                          Timer(const Duration(seconds: 2), () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              RoutesPath.homePage,
                              (route) => false,
                            );
                          });
                        }
                      },
                      builder: (context, state) {
                        return Row(
                          children: [
                            StepBarWidget(
                              isCompleted: state.currentIndex == 1,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            StepBarWidget(
                              isCompleted: state.currentIndex == 2,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            StepBarWidget(
                              isCompleted: state.currentIndex == 3,
                            ),
                            const Spacer(),
                            CustomButton.rounded(
                              type: CustomButtonType.rounded,
                              width: 130,
                              label: 'Next',
                              onPress: () {
                                BlocProvider.of<ProgressBarCubit>(context)
                                    .nextWelcomeStep();
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
