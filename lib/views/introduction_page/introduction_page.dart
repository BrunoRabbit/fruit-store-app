import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_store_app/controllers/main_controller.dart';
import 'package:fruit_store_app/controllers/welcome_page_controller.dart';
import 'package:fruit_store_app/views/welcome_page/bloc/progress_bar_bloc.dart';
import 'package:fruit_store_app/views/welcome_page/bloc/progress_bar_state.dart';
import 'package:fruit_store_app/views/welcome_page/widgets/step_bar_widget.dart';
import 'package:fruit_store_app/widgets/custom_button.dart';
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
        child: BlocConsumer<ProgressBarBloc, ProgressBarState>(
          bloc: progressBarBloc,
          listener: (context, state) {
            print('go ahead');
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
          },
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
                    children: [
                      StepBarWidget(
                        isCompleted: state.step == 0,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      StepBarWidget(
                        isCompleted: state.step == 1,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      StepBarWidget(
                        isCompleted: state.step == 2,
                      ),
                      const Spacer(),
                      CustomButton.rounded(
                        type: CustomButtonType.rounded,
                        width: 130,
                        label: 'Next',
                        onPress: () {
                          progressBarBloc.add(
                            ChangeStepBarEvent(state.step + 1),
                          );
                        },
                      ),
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
