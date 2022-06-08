import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_store_app/app/widgets/app_custom_text.dart';
import 'package:fruit_store_app/controllers/welcome_page_controller.dart';
import 'package:fruit_store_app/pages/welcome/step_one/bloc/progress_bar_state.dart';
import 'package:fruit_store_app/pages/welcome/widgets/step_bar_section.dart';
import 'package:fruit_store_app/styles/default_styles.dart';
import 'package:fruit_store_app/pages/welcome/step_one/bloc/progress_bar_bloc.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final _controller = WelcomePageController();
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
                              child: const AppCustomText(
                                label: 'Skip',
                                color: Colors.black87,
                                fontFamily: 'Inter-Bold',
                                size: 15,
                              ),
                            )
                          : GestureDetector(
                              onTap: () {},
                              child: const AppCustomText(
                                label: 'Skip',
                                color: Colors.transparent,
                                fontFamily: 'Inter-Bold',
                                size: 15,
                              ),
                            ),
                      const Spacer(),
                      StepBarSection(currentIndex: state.step),
                      const Spacer(),
                      state.step != 2
                          ? GestureDetector(
                              onTap: () => progressBarBloc.add(
                                ChangeStepBarEvent(state.step + 1),
                              ),
                              child: const Icon(FeatherIcons.arrowRight),
                            )
                          : GestureDetector(
                              onTap: () {},
                              child: const Icon(
                                FeatherIcons.arrowRight,
                                color: Colors.transparent,
                              ),
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
