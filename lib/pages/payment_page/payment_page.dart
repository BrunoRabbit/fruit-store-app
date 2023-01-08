import 'package:flutter/material.dart';
import 'package:fruit_store_app/app/widgets/app_bar_widget.dart';
import 'package:fruit_store_app/app/widgets/app_custom_text.dart';
import 'package:fruit_store_app/controllers/product_controller.dart';
import 'package:fruit_store_app/styles/color_theme.dart';
import 'package:provider/provider.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<ProductController>(context);
    return Scaffold(
      appBar: AppBarWidget(
        isHomeScreen: false,
        isNeedButton: false,
        isImplyLeading: true,
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 40,
          top: 15,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppCustomText(
              label: 'Payment',
              fontFamily: 'Inter-Bold',
              size: 26,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 22, right: 16),
              child: Row(
                children: [
                  const AppCustomText(
                    label: 'Shipping to',
                    fontFamily: 'Inter-SemiBold',
                    size: 20,
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: const StadiumBorder(),
                      side: const BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    child: const AppCustomText(
                      label: 'Add',
                      color: Colors.black,
                      fontFamily: 'Inter-Medium',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: Row(
                children: [
                  const AppCustomText(
                    label: 'Home',
                    fontFamily: 'Inter-Medium',
                    size: 18,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: const Icon(Icons.edit),
                  ),
                ],
              ),
              isThreeLine: true,
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('sub'),
                  Text('sub'),
                ],
              ),
              visualDensity: VisualDensity.comfortable,
              value: _controller.isChecked,
              onChanged: (value) {
                setState(() {
                  _controller.isChecked = value!;
                });
              },
            ),
            const SizedBox(
              height: 15,
            ),
            const AppCustomText(
              label: 'Payment method',
              fontFamily: 'Inter-SemiBold',
              size: 20,
            ),
            const SizedBox(
              height: 15,
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: const Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.ac_unit,
                  size: 35,
                ),
              ),
              visualDensity: VisualDensity.comfortable,
              value: _controller.isChecked,
              onChanged: (value) {
                setState(() {
                  _controller.isChecked = value!;
                });
              },
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: const Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.ac_unit,
                  size: 35,
                ),
              ),
              visualDensity: VisualDensity.comfortable,
              value: _controller.isChecked,
              onChanged: (value) {
                setState(() {
                  _controller.isChecked = value!;
                });
              },
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: const Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.ac_unit,
                  size: 35,
                ),
              ),
              visualDensity: VisualDensity.comfortable,
              value: _controller.isChecked,
              onChanged: (value) {
                setState(() {
                  _controller.isChecked = value!;
                });
              },
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: const Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.ac_unit,
                  size: 35,
                ),
              ),
              visualDensity: VisualDensity.comfortable,
              value: _controller.isChecked,
              onChanged: (value) {
                setState(() {
                  _controller.isChecked = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
