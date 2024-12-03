import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:refix/src/core/navigation/routes.dart';
import 'package:refix/src/core/ui/theme/colors.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/core/ui/widgets/button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  final controller = PageController();
  int currentIndex = 0;
  final images = [
    "assets/img/boarding/boarding1.jpg",
    "assets/img/boarding/boarding2.jpg",
    "assets/img/boarding/boarding3.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.white));
    return Scaffold(
        body: PageView.builder(
            controller: controller,
            itemCount: images.length,
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            itemBuilder: (context, index) {
              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                colorFilter: ColorFilter.mode(
                                    AppColors.primaryRefix.withOpacity(0.8),
                                    BlendMode.darken),
                                image: AssetImage(images[index]),
                                fit: BoxFit.cover)),
                      ),
                      currentIndex == 2
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
                          : const SizedBox.shrink()
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AnimatedSmoothIndicator(
                        activeIndex: currentIndex,
                        count: images.length,
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
                        height: currentIndex != 2 ? 230 : 280,
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
                              const Text(
                                "Write Title Here",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: AppTextSize.six),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              const Text(
                                "This sentence is used as a substitute for real text in the fields of printing and design.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: AppTextSize.two,
                                    color: AppColors.neutralRefix),
                              ),
                              const Spacer(),
                              currentIndex == 2
                                  ? Column(
                                      children: [
                                        const SizedBox(
                                          height: 24,
                                        ),
                                        PrimaryButton(
                                            text: "Get Started",
                                            onPressed: () {
                                              context.go("/sign_up");
                                            }),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        SecondaryButton(
                                            text: "Sign In",
                                            onPressed: () {
                                              context.go("/login");
                                            }),
                                      ],
                                    )
                                  : PrimaryButton(
                                      text: "Next",
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
            }));
  }
}
