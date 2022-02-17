import 'package:flutter/material.dart';
import 'package:fruit_store_app/styles/default_styles.dart';
import 'package:fruit_store_app/widgets/custom_text.dart';

class SearchFruits extends StatelessWidget {
  const SearchFruits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        const CustomText(
          fontFamily: 'Inter-Bold',
          label: 'Welcome \$user,',
          size: 30,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomText(
          label: 'Find fresh fruits what you want',
          size: 16,
          color: Colors.black.withOpacity(0.5),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: defaultPadding / 2,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              cursorColor: Colors.black.withOpacity(0.5),
              decoration: InputDecoration(
                hintText: 'Search fresh fruits',
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
