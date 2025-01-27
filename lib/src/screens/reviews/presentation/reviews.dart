import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:refix/src/core/localization/domain.dart';
import 'package:refix/src/core/ui/theme/colors.dart';
import 'package:refix/src/core/ui/widgets/header.dart';
import 'package:refix/src/screens/reviews/domain/reviews_domain.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key, required this.type});

  final String type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutral50,
      appBar: AppBar(),
      body: Consumer(builder: (context, ref, child) {
        final reviews = ref.watch(getReviewsProvider(type: type));
        return reviews.when(
            data: (data) {
              if (data.isEmpty) {
                return Center(
                  child: Text(context.tr.noReviews),
                );
              }
              return Column(
                children: [
                  Container(
                    color: AppColors.white,
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextHeader(
                          text: "Latest ${data.length} Reviews",
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                        itemCount: data.length,
                        separatorBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Divider(),
                          );
                        },
                        itemBuilder: (context, index) {
                          return Review(
                            name: data[index].customer.username,
                            starsCount: data[index].rating.toInt(),
                            content: data[index].comment ?? "",
                            date: data[index].createdAt!.timeZoneName,
                          );
                        }),
                  )
                ],
              );
            },
            error: (e, s) {
              log("[Reviews Error]", error: e, stackTrace: s);
              return const Center(
                child: Text("Error"),
              );
            },
            loading: () => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ));
      }),
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
    return ListTile(
        leading: const CircleAvatar(
          radius: 30,
        ),
        subtitle: Column(
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
        trailing: Text(date));
  }
}
