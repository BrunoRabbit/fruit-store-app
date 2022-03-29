import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fruit_store_app/styles/default_styles.dart';
import 'package:fruit_store_app/widgets/custom_text.dart';

class SearchFruits extends StatelessWidget {
  const SearchFruits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firestoreRef = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        user.displayName != null
            ? CustomText(
                label:
                    'Hi, ${user.displayName![0].toUpperCase()}${user.displayName!.substring(1).toLowerCase()}',
                color: Colors.black87,
                size: 30,
                fontFamily: 'Inter-Bold',
              )
            : StreamBuilder<QuerySnapshot>(
                stream: firestoreRef.collection('Users').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<QueryDocumentSnapshot<Object?>> items =
                        snapshot.data!.docs;

                    return CustomText(
                      label: 'Hi, ' + items[0]['displayName'],
                      color: Colors.black87,
                      size: 30,
                      fontFamily: 'Inter-Bold',
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
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
