import 'package:dashboard/src/core/theme/btns.dart';
import 'package:dashboard/src/core/theme/radii.dart';
import 'package:dashboard/src/screens/content/domain/onetime_domain.dart';
import 'package:dashboard/src/screens/content/onetime_edit.dart';
import 'package:dashboard/src/screens/navbar/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
                          onPressed: () async {
                            final imageN = await http.get(Uri.parse(
                                "https://api.refixapp.com/${data[index].image}"));
                            final bytesImage = imageN.bodyBytes;
                            ref.read(boardingInfoProvider.notifier).state =
                                BoardingUpdate(
                                    image: bytesImage,
                                    detailsEn: data[index].details.en,
                                    headingEn: data[index].heading.en,
                                    id: data[index].id,
                                    detailsAr: data[index].details.ar,
                                    headingAr: data[index].heading.ar);
                            ref.read(currentIndexProvider.notifier).state = 5;
                          },
                          title: data[index].heading.en,
                          description: data[index].details.en,
                          networkImage:
                              "https://api.refixapp.com/${data[index].image}",
                          text: "Screen ${index + 1}",
                        ),
                      );
                    });
              },
              error: (e, s) => Center(child: Text("Error: $e")),
              loading: () => const Center(child: CircularProgressIndicator()))),
    );
  }
}

class BoardingInfo extends StatelessWidget {
  const BoardingInfo(
      {super.key,
      required this.text,
      required this.networkImage,
      required this.title,
      required this.description,
      required this.id,
      required this.onPressed});

  final String text, title, description, id;
  final String? networkImage;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                child: networkImage == null
                    ? const Icon(Icons.broken_image)
                    : Image.network(
                        height: 270,
                        width: 408,
                        fit: BoxFit.cover,
                        networkImage!,
                      ),
              ),
              Text(title,
                  style: const TextStyle(
                      fontSize: AppTextSize.six, fontWeight: FontWeight.w500)),
              Text(description,
                  style: const TextStyle(
                      fontSize: AppTextSize.two, fontWeight: FontWeight.w400)),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Consumer(builder: (context, ref, child) {
          return PrimaryButton(
            text: "Edit",
            onPressed: onPressed,
            loading: false,
          );
        })
      ],
    );
  }
}
