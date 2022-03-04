import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_store_app/controllers/welcome_page_controller.dart';
import 'package:fruit_store_app/views/introduction_page/welcome_page/bloc/cubit/progress_bar_cubit.dart';
import 'package:fruit_store_app/views/introduction_page/welcome_page/widgets/step_bar_widget.dart';
import 'package:fruit_store_app/widgets/custom_button.dart';
import 'package:fruit_store_app/routes/app_routes.dart';
import 'package:fruit_store_app/styles/default_styles.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final _controller = IntroductionController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller.pageController,
                itemCount: _controller.listScreens.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Stack(
                    alignment: Alignment.topLeft,
                    children: [_controller.listScreens[index]],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: defaultPadding * 1.8,
                horizontal: defaultPadding,
              ),
              child: BlocConsumer<ProgressBarCubit, ProgressBarState>(
                listener: (context, state) {
                  if (state.currentIndex == 4) {
                    print('Go Ahead');
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   const SnackBar(
                    //     content: Text('Carregando!'),
                    //     duration: Duration(seconds: 4),
                    //   ),
                    // );
                    // Timer(const Duration(seconds: 2), () {
                    //   Navigator.of(context).pushNamedAndRemoveUntil(
                    //     RoutesPath.homePage,
                    //     (route) => false,
                    //   );
                    // });
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
                        isCompleted:
                            state.currentIndex == 3 || state.currentIndex == 4,
                      ),
                      const Spacer(),
                      CustomButton.rounded(
                        type: CustomButtonType.rounded,
                        width: 130,
                        label: 'Next',
                        onPress: () {
                          BlocProvider.of<ProgressBarCubit>(context)
                              .nextWelcomeStep();
                          if (_controller.pageController.hasClients) {
                            if (state.currentIndex <= 3) {
                              _controller.pageController.animateToPage(
                                state.currentIndex,
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOutQuart,
                              );
                            }
                          }
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
    );
  }
}
