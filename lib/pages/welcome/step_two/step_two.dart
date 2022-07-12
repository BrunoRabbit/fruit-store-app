import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_store_app/app/widgets/app_bar_widget.dart';
import 'package:fruit_store_app/app/widgets/app_custom_text.dart';
import 'package:fruit_store_app/controllers/welcome_page_controller.dart';
import 'package:provider/provider.dart';

class StepTwo extends StatefulWidget {
  const StepTwo({Key? key}) : super(key: key);

  @override
  State<StepTwo> createState() => _StepTwoState();
}

class _StepTwoState extends State<StepTwo> {
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<WelcomePageController>(context);
    return Scaffold(
      appBar: AppBarWidget(
        icon: Icons.arrow_back_rounded,
        isHomeScreen: false,
        onPressed: () {
          setState(() {
            _controller.stepIndex - 1;
          });
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 300,
              child: SvgPicture.asset(
                './assets/svgs/order-confirm.svg',
              ),
            ),
            const Spacer(),
            const SizedBox(
              height: 75,
              width: double.infinity,
              child: AppCustomText(
                label: 'See stores \nthat support us',
                fontFamily: 'Inter-Bold',
                size: 32,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const SizedBox(
              width: double.infinity,
              child: AppCustomText(
                label:
                    'You can see the distance between the store and you, and how much people like her',
                fontFamily: 'Inter-Medium',
                size: 18,
                color: Colors.black87,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
