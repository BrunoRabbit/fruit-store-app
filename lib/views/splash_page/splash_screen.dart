import 'package:flutter/material.dart';
import 'package:fruit_store_app/widgets/custom_button.dart';
import 'package:fruit_store_app/widgets/custom_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Spacer(),
              Image.asset(
                './assets/images/logo.png',
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: CustomText(
                  label: 'Order your favorites fruits',
                  fontFamily: 'Inter-Bold',
                  size: 32,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomText(
                label: 'Eat fresh fruits and try to be healthy',
                size: 20,
                fontFamily: 'Inter-Medium',
                color: Colors.black87,
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  children: [
                    Row(
                      children: [
                        LayoutBuilder(
                          builder: (context, constraints) {
                            return Stack(
                              children: [
                                Container(
                                  height: 6,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  height: 6,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                    const Spacer(),
                    CustomButton(
                      width: 130,
                      label: 'Next',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
