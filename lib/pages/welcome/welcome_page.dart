import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:fruit_store_app/app/widgets/app_custom_text.dart';
import 'package:fruit_store_app/controllers/welcome_page_controller.dart';
import 'package:fruit_store_app/pages/welcome/widgets/step_bar_section.dart';
import 'package:fruit_store_app/styles/default_styles.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<WelcomePageController>(context);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: _controller.listScreens[_controller.stepIndex],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: defaultPadding * 1.8,
              horizontal: defaultPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _controller.stepIndex != 2
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            _controller.stepIndex = 2;
                          });
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
                StepBarSection(
                  currentIndex: _controller.stepIndex,
                ),
                const Spacer(),
                _controller.stepIndex != 2
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            _controller.stepIndex++;
                          });
                        },
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
      )),
    );
  }
}
