import 'package:dashboard/src/screens/ads/ads_edit.dart';
import 'package:dashboard/src/screens/ads/domain/ads_domain.dart';
import 'package:dashboard/src/screens/booking/presentation/booking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../content/onetime.dart';
import '../navbar/navbar.dart';

class AdsScreen extends ConsumerWidget {
  const AdsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ads = ref.watch(getAdsProvider());
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ads.when(
              data: (data) {
                final sliders =
                    data.where((ad) => ad.type == AdsType.slider.name).toList();
                final banners =
                    data.where((ad) => ad.type == AdsType.banner.name).toList();

                return Column(
                  children: [
                    const TextHeader(text: "Sliders Ads"),
                    SizedBox(
                        height: 350,
                        child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: sliders.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  width: 48,
                                ),
                            itemBuilder: (context, index) {
                              return SizedBox(
                                height: 400,
                                width: 408,
                                child: BoardingInfo(
                                  onPressed: () async {
                                    ref.read(adInfoProvider.notifier).state = (
                                      type: AdsType.slider.name,
                                      id: sliders[index].id,
                                      image:
                                          "https://refix-api.onrender.com/${sliders[index].image}"
                                    );
                                    ref
                                        .read(currentIndexProvider.notifier)
                                        .state = 7;
                                  },
                                  id: sliders[index].id,
                                  title: "",
                                  description: "",
                                  networkImage:
                                      "https://refix-api.onrender.com/${sliders[index].image}",
                                  text: "Screen ${index + 1}",
                                ),
                              );
                            })),
                    const TextHeader(text: "Banners Ads"),
                    SizedBox(
                        height: 350,
                        child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: banners.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  width: 48,
                                ),
                            itemBuilder: (context, index) {
                              return SizedBox(
                                height: 400,
                                width: 408,
                                child: BoardingInfo(
                                  id: banners[index].id,
                                  onPressed: () {
                                    ref.read(adInfoProvider.notifier).state = (
                                      type: AdsType.banner.name,
                                      id: banners[index].id,
                                      image:
                                          "https://refix-api.onrender.com/${banners[index].image}"
                                    );

                                    ref
                                        .read(currentIndexProvider.notifier)
                                        .state = 7;
                                  },
                                  title: "",
                                  description: "",
                                  networkImage:
                                      "https://refix-api.onrender.com/${banners[index].image}",
                                  text: "Screen ${index + 1}",
                                ),
                              );
                            })),
                  ],
                );
              },
              error: (e, s) {
                return const Center(child: Text("Error"));
              },
              loading: () => const Center(child: CircularProgressIndicator()))),
    );
  }
}
