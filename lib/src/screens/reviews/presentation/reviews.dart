import 'package:flutter/material.dart';
import 'package:refix/src/core/ui/theme/colors.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/core/ui/widgets/header.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutral50,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: AppColors.white,
              padding: const EdgeInsets.all(16),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextHeader(
                    text: "Latest 45K Reviews",
                  ),
                  Text("Sort by: Latest")
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const Review(
                      name: "Mazen",
                      starsCount: 4,
                      content: "sd",
                      date: "1/1/1",
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class Review extends StatelessWidget {
  const Review({
    super.key,
    required this.name,
    required this.date,
    required this.content,
    required this.starsCount,
  });

  final String name, date, content;
  final int starsCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                  ),
                  const SizedBox(
                    width: AppSpacing.x,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextHeader(text: name),
                      SizedBox(
                        height: 15,
                        width: 60,
                        child: ListView.builder(
                          itemCount: starsCount,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return const Icon(
                              Icons.star_rounded,
                              color: AppColors.primaryRefix,
                              size: 12,
                            );
                          },
                        ),
                      ),
                      Text(content)
                    ],
                  ),
                ],
              ),
              Text(date)
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Divider(),
        )
      ],
    );
  }
}
