import 'package:flutter/material.dart';

import 'package:fruit_store_app/styles/color_theme.dart';

import 'custom_text.dart';

class CardNear extends StatelessWidget {
  final String title;
  final String image;
  final String hours;
  final String stars;
  final String distance;

  const CardNear({
    Key? key,
    required this.title,
    required this.image,
    required this.hours,
    required this.stars,
    required this.distance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            height: 90,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(12),
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Icon
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'Inter-Bold',
                            color: Colors.black87,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          hours,
                          style: const TextStyle(
                            fontFamily: 'Inter-Medium',
                            color: Colors.black54,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              size: 18,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              stars,
                              style: const TextStyle(
                                fontFamily: 'Inter-Bold',
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              '|',
                              style: TextStyle(
                                fontFamily: 'Inter-Bold',
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.location_on,
                              size: 18,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              distance,
                              style: const TextStyle(
                                fontFamily: 'Inter-Bold',
                                color: Colors.black87,
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
