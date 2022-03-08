import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_store_app/views/home_page/widgets/app_bar_widget.dart';
import 'package:fruit_store_app/views/welcome/step_one/bloc/progress_bar_bloc.dart';
import 'package:fruit_store_app/widgets/custom_text.dart';

class StepTwo extends StatefulWidget {
  const StepTwo({Key? key}) : super(key: key);

  @override
  State<StepTwo> createState() => _StepTwoState();
}

class _StepTwoState extends State<StepTwo> {
  late ProgressBarBloc progressBarBloc;

  @override
  void initState() {
    progressBarBloc = BlocProvider.of<ProgressBarBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        icon: Icons.arrow_back_rounded,
        isHomeScreen: false,
        onPressed: () {
          progressBarBloc.add(ChangeStepBarEvent(0));
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
              child: CustomText(
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
              child: CustomText(
                label:
                    'You can see the distance, and how much people like the store',
                fontFamily: 'Inter-Medium',
                size: 18,
                color: Colors.black87,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
