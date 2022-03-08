import 'package:flutter/material.dart';
import 'package:fruit_store_app/widgets/custom_text.dart';

class StepOne extends StatelessWidget {
  const StepOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
            ],
          ),
        ),
      ],
    );
  }
}
