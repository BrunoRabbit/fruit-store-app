import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_store_app/controllers/welcome_page_controller.dart';
import 'package:fruit_store_app/views/welcome/step_one/bloc/progress_bar_bloc.dart';
import 'package:fruit_store_app/views/welcome/step_one/bloc/progress_bar_state.dart';
import 'package:fruit_store_app/views/welcome/widgets/step_bar_section.dart';
import 'package:fruit_store_app/views/welcome/widgets/step_bar_widget.dart';
import 'package:fruit_store_app/widgets/custom_button.dart';
import 'package:fruit_store_app/styles/default_styles.dart';
import 'package:fruit_store_app/widgets/custom_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final _controller = IntroductionController();
  late ProgressBarBloc progressBarBloc;

  @override
  void initState() {
    progressBarBloc = BlocProvider.of<ProgressBarBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ProgressBarBloc, ProgressBarState>(
          bloc: progressBarBloc,
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: _controller.listScreens[state.step],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: defaultPadding * 1.8,
                    horizontal: defaultPadding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      state.step != 2
                          ? GestureDetector(
                              onTap: () {
                                progressBarBloc.add(ChangeStepBarEvent(2));
                              },
                              child: const CustomText(
                                label: 'Skip',
                                color: Colors.black87,
                                fontFamily: 'Inter-Bold',
                                size: 15,
                              ),
                            )
                          : GestureDetector(
                              onTap: () {},
                              child: const CustomText(
                                label: '',
                                color: Colors.black87,
                                fontFamily: 'Inter-Bold',
                                size: 15,
                              ),
                            ),
                      const Spacer(
                        flex: 3,
                      ),
                      StepBarSection(
                        currentIndex: state.step,
                      ),
                      state.step != 2
                          ? const Spacer(
                              flex: 1,
                            )
                          : const Spacer(
                              flex: 3,
                            ),
                      state.step != 2
                          ? CustomButton.rounded(
                              type: CustomButtonType.rounded,
                              width: 120,
                              label: 'Next',
                              onPress: () {
                                progressBarBloc.add(
                                  ChangeStepBarEvent(state.step + 1),
                                );
                              },
                            )
                          : Container(),
                      state.step == 2
                          ? const SizedBox(
                              width: 25,
                            )
                          : Container(),
                      // : CustomButton.rounded(
                      //     type: CustomButtonType.rounded,
                      //     btnColor: Colors.transparent,
                      //     width: 120,
                      //     height: 40,
                      //     label: ' ',
                      //     onPress: () {},
                      //   ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
