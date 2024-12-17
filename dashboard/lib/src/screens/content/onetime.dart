import 'package:dashboard/src/core/navigation/api.dart';
import 'package:dashboard/src/core/theme/btns.dart';
import 'package:dashboard/src/core/theme/radii.dart';
import 'package:dashboard/src/screens/content/domain/onetime_domain.dart';
import 'package:dashboard/src/screens/content/onetime_edit.dart';
import 'package:dashboard/src/screens/navbar/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import 'data/boarding_data.dart';

class OnetimeScreen extends ConsumerWidget {
  const OnetimeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screens = ref.watch(getBoardingProvider);
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(24.0),
          // child: Row(
          child: screens.when(
              data: (data) {
                return ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 48,
                        ),
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 400,
                        width: 408,
                        child: BoardingInfo(
                          id: data[index].id,
                          title: data[index].heading,
                          description: data[index].details,
                          networkImage:
                              "https://refix-api.onrender.com/${data[index].image}",
                          text: "Screen ${index + 1}",
                        ),
                      );
                    });
              },
              error: (e, s) => const Center(child: Text("Error")),
              loading: () => const Center(child: CircularProgressIndicator()))),
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
    required this.id,
  });

  final String text, networkImage, title, description, id;

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
            padding: const EdgeInsets.all(16),
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
                    height: 270,
                    width: 408,
                    fit: BoxFit.cover,
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
                onPressed: () async {
                  final imageN = await http.get(Uri.parse(networkImage));
                  final bytesImage = imageN.bodyBytes;
                  print(bytesImage);
                  ref.read(boardingInfoProvider.notifier).state =
                      BoardingUpdate(
                          image: bytesImage,
                          detailsEn: description,
                          headingEn: title,
                          id: id,
                          detailsAr: description,
                          headingAr: title);
                  ref.read(currentIndexProvider.notifier).state = 5;
                });
          })
        ],
      ),
    );
  }
}
