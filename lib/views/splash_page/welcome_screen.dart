import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_store_app/styles/default_styles.dart';
import 'package:fruit_store_app/views/splash_page/bloc/cubit/progress_bar_cubit.dart';
import 'package:fruit_store_app/widgets/custom_button.dart';
import 'package:fruit_store_app/widgets/custom_text.dart';
import 'package:fruit_store_app/widgets/step_bar_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.center,
                height: 300,
                child: Image.asset(
                  './assets/images/logo.png',
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
                child: BlocBuilder<ProgressBarCubit, int>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        StepBarWidget(
                          isCompleted: state == 1,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        StepBarWidget(
                          isCompleted: state == 2,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        StepBarWidget(
                          isCompleted: state == 3,
                        ),
                        const Spacer(),
                        CustomButton(
                          width: 130,
                          label: 'Next',
                          onPressed: () {
                            BlocProvider.of<ProgressBarCubit>(context)
                                .nextWelcomeStep();
                          },
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}