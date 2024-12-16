import 'package:dashboard/src/core/theme/btns.dart';
import 'package:dashboard/src/core/theme/radii.dart';
import 'package:dashboard/src/screens/navbar/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class OnetimeScreen extends StatelessWidget {
  const OnetimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Row(
          spacing: 48,
          children: [
            BoardingInfo(
              text: "Screen 1",
              title: "Title",
              description: "Description",
              networkImage:
                  "https://pettownsendvet.com/wp-content/uploads/2023/01/iStock-1052880600.jpg",
            ),
            BoardingInfo(
              text: "Screen 1",
              title: "Title",
              description: "Description",
              networkImage:
                  "https://pettownsendvet.com/wp-content/uploads/2023/01/iStock-1052880600.jpg",
            ),
            BoardingInfo(
              text: "Screen 1",
              title: "Title",
              description: "Description",
              networkImage:
                  "https://pettownsendvet.com/wp-content/uploads/2023/01/iStock-1052880600.jpg",
            ),
          ],
        ),
      ),
    );
  }
}

class BoardingInfo extends StatelessWidget {
  const BoardingInfo({
    super.key,
    required this.text,
    required this.networkImage,
    required this.title,
    required this.description,
  });

  final String text, networkImage, title, description;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            text,
            style: const TextStyle(
                fontSize: AppTextSize.five, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                  child: Image.network(
                    networkImage,
                  ),
                ),
                Text(title,
                    style: const TextStyle(
                        fontSize: AppTextSize.six,
                        fontWeight: FontWeight.w500)),
                Text(description,
                    style: const TextStyle(
                        fontSize: AppTextSize.two,
                        fontWeight: FontWeight.w400)),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Consumer(builder: (context, ref, child) {
            return PrimaryButton(
                text: "Edit",
                onPressed: () =>
                    ref.read(currentIndexProvider.notifier).state = 5);
          })
        ],
      ),
    );
  }
}
