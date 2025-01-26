import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:refix/src/core/localization/domain.dart';
import 'package:refix/src/core/ui/theme/colors.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/core/ui/widgets/button.dart';
import 'package:refix/src/screens/boarding/domain/boarding_domain.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingScreen extends ConsumerStatefulWidget {
  const BoardingScreen({super.key});

  @override
  ConsumerState<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends ConsumerState<BoardingScreen> {
  final controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final boarding = ref.watch(getBoardingProvider);
    return Scaffold(
        body: boarding.when(
            data: (data) {
              if (data.isEmpty) {
                return const Center(child: Text("No Boarding found"));
              }
              return Stack(
                children: [
                  PageView.builder(
                      controller: controller,
                      itemCount: data.length,
                      onPageChanged: (value) {
                        setState(() {
                          currentIndex = value;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      colorFilter: ColorFilter.mode(
                                          AppColors.primaryRefix
                                              .withValues(alpha: .8),
                                          BlendMode.darken),
                                      image: CachedNetworkImageProvider(
                                          "https://api.refixapp.com/${data[index].image}"),
                                      fit: BoxFit.cover)),
                            ),
                            currentIndex == data.length - 1
                                ? SafeArea(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: OutlinedButton(
                                          onPressed: () {
                                            context.go("/");
                                          },
                                          child: const Text("Skip")),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ],
                        );
                      }),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AnimatedSmoothIndicator(
                        activeIndex: currentIndex,
                        count: data.length,
                        effect: const ExpandingDotsEffect(
                            dotColor: AppColors.white,
                            dotWidth: 10,
                            dotHeight: 7,
                            activeDotColor: AppColors.primaryRefix),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      AnimatedContainer(
                        height: currentIndex != data.length - 1 ? 230 : 280,
                        duration: const Duration(milliseconds: 300),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(AppRadii.x1),
                              topRight: Radius.circular(AppRadii.x1),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              FittedBox(
                                fit: BoxFit.fitHeight,
                                child: Text(
                                  data[currentIndex].heading.localized,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: AppTextSize.six),
                                ),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Text(
                                data[currentIndex].details.localized,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: AppTextSize.two,
                                    color: AppColors.neutralRefix),
                              ),
                              const Spacer(),
                              currentIndex == data.length - 1
                                  ? Column(
                                      children: [
                                        const SizedBox(
                                          height: 24,
                                        ),
                                        PrimaryButton(
                                            text: context.tr.get_started,
                                            onPressed: () {
                                              context.go("/sign_up");
                                            }),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        SecondaryButton(
                                            text: context.tr.sign_in,
                                            onPressed: () {
                                              context.go("/login");
                                            }),
                                      ],
                                    )
                                  : PrimaryButton(
                                      text: context.tr.next ?? "Next",
                                      onPressed: () {
                                        controller.nextPage(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.easeInCirc);
                                      })
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            error: (e, s) {
              debugPrint("Error $e");
              return const Center(child: Text("Error"));
            },
            loading: () => const Center(child: CircularProgressIndicator())));
  }
}
