import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:refix/src/core/localization/domain.dart';
import 'package:refix/src/core/ui/theme/colors.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/screens/auth/domain/notification.dart';
import 'package:refix/src/screens/home/components/icon_container.dart';
import 'package:refix/src/screens/home/domain/home_domain.dart';

import '../../core/ui/widgets/button.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    ref.read(sendFCMTokenProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  color: AppColors.neutralRefix,
                  border: Border.all(),
                  shape: BoxShape.circle),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.notifications,
                  color: AppColors.neutralRefix,
                  size: 16,
                ),
                onPressed: () => context.push("/notifications"),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: AppColors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: SearchBar(
                        hintText: context.tr.search,
                        leading: SvgPicture.asset("assets/img/home/search.svg"),
                        constraints: BoxConstraints(
                            minWidth: MediaQuery.sizeOf(context).width,
                            minHeight: 52),
                      ),
                    ),
                    const SizedBox(
                      height: AppSpacing.x2,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                          spacing: 24,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconContainer(
                              name: context.tr.electrical_systems,
                              svgPath: "assets/img/home/electrical.svg",
                            ),
                            IconContainer(
                              name: context.tr.plumbing_systems,
                              svgPath: "assets/img/home/plumber.svg",
                            ),
                            IconContainer(
                              name: context.tr.air,
                              svgPath: "assets/img/home/motor.svg",
                            ),
                          ]),
                    ),
                    const SizedBox(
                      height: AppSpacing.x2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: LayoutBuilder(builder: (context, constrains) {
                        final smallDevice = constrains.maxWidth < 360;
                        if (smallDevice) {
                          return Column(
                            children: [
                              ElevatorIconContainer(
                                name: context.tr.control,
                                svgPath: "assets/img/home/paint.svg",
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              ElevatorIconContainer(
                                name: context.tr.fire,
                                svgPath: "assets/img/home/fire.svg",
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              ElevatorIconContainer(
                                name: context.tr.other,
                                svgPath: "assets/img/home/add.svg",
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              ElevatorIconContainer(
                                name: context.tr.emergency,
                                svgPath: "assets/img/home/alert.svg",
                              ),
                            ],
                          );
                        }
                        return SizedBox(
                          height: 152,
                          child: GridView.builder(
                              itemCount: 4,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisExtent: 64,
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 24,
                                      crossAxisSpacing: 24),
                              itemBuilder: (context, index) {
                                return [
                                  ElevatorIconContainer(
                                    name: context.tr.electrical_systems,
                                    svgPath: "assets/img/home/paint.svg",
                                  ),
                                  ElevatorIconContainer(
                                    name: context.tr.fire,
                                    svgPath: "assets/img/home/fire.svg",
                                  ),
                                  ElevatorIconContainer(
                                    name: context.tr.other,
                                    svgPath: "assets/img/home/add.svg",
                                  ),
                                  ElevatorIconContainer(
                                    name: context.tr.emergency,
                                    svgPath: "assets/img/home/alert.svg",
                                  ),
                                ][index];
                              }),
                        );
                      }),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: AppSpacing.lg,
              ),
              Container(
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.x),
                  child: Column(
                    children: [
                      Consumer(builder: (context, ref, child) {
                        final ads =
                            ref.watch(getAdsProvider(type: AdsType.slider));
                        return ads.when(
                            data: (data) {
                              print(data);
                              if (data.isEmpty) {
                                return const Center(
                                    child: Text("No Ads at the moment"));
                              }
                              return CarouselSlider(
                                options: CarouselOptions(
                                    height: 143.0,
                                    initialPage: 0,
                                    enlargeFactor: 0,
                                    padEnds: false,
                                    enableInfiniteScroll: false),
                                items: data.map((i) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Container(
                                        padding: EdgeInsets.zero,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: CachedNetworkImageProvider(
                                                    "https://refix-api.onrender.com/${i.image}")),
                                            borderRadius: BorderRadius.circular(
                                                AppRadii.lg),
                                            border: Border.all(
                                                color: AppColors.neutralRefix)),
                                      );
                                    },
                                  );
                                }).toList(),
                              );
                            },
                            error: (e, s) {
                              debugPrint("Error: $e");
                              return const Text("Error");
                            },
                            loading: () => const CircularProgressIndicator());
                      })
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: AppSpacing.lg,
              ),
              Container(
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.x),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  context.tr.not_available,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: AppTextSize.two.toDouble()),
                                ),
                                Text(
                                  context.tr.not_available2,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: AppTextSize.one.toDouble()),
                                )
                              ],
                            ),
                          ),
                          SvgPicture.asset("assets/img/home/chat.svg")
                        ],
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      PrimaryButton(
                        text: context.tr.chat,
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: AppSpacing.lg,
              ),
              Consumer(builder: (context, ref, child) {
                final ads = ref.watch(getAdsProvider(type: AdsType.banner));

                return ads.when(
                    data: (data) {
                      if (data.isEmpty) {
                        return const SizedBox.shrink();
                      }
                      return Container(
                        color: AppColors.white,
                        padding: const EdgeInsets.all(AppSpacing.x),
                        child: Container(
                          height: 367,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: CachedNetworkImageProvider(
                                      "https://refix-api.onrender.com/${data.first.image}")),
                              borderRadius: BorderRadius.circular(AppRadii.lg),
                              border:
                                  Border.all(color: AppColors.neutralRefix)),
                        ),
                      );
                    },
                    error: (e, s) => const Text("Error Banner Ad"),
                    loading: () => const CircularProgressIndicator.adaptive());
              }),
              const SizedBox(
                height: AppSpacing.lg,
              ),
              Container(
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.x),
                  child: Column(
                    children: [
                      Consumer(builder: (context, ref, child) {
                        final ads =
                            ref.watch(getAdsProvider(type: AdsType.slider));

                        return ads.when(
                            data: (data) {
                              return CarouselSlider(
                                options: CarouselOptions(
                                    height: 143.0,
                                    initialPage: 0,
                                    enlargeFactor: 0,
                                    padEnds: false,
                                    enableInfiniteScroll: false),
                                items: data.map((i) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Container(
                                        padding: EdgeInsets.zero,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: CachedNetworkImageProvider(
                                                    "https://refix-api.onrender.com/${i.image}")),
                                            borderRadius: BorderRadius.circular(
                                                AppRadii.lg),
                                            border: Border.all(
                                                color: AppColors.neutralRefix)),
                                      );
                                    },
                                  );
                                }).toList(),
                              );
                            },
                            error: (e, s) => const Center(child: Text("Error")),
                            loading: () =>
                                const CircularProgressIndicator.adaptive());
                      })
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
