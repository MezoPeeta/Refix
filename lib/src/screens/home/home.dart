import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:refix/src/core/ui/theme/colors.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/screens/home/components/icon_container.dart';

import '../../core/ui/widgets/button.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final services = [
    const ElevatorIconContainer(
      name: 'Control And Automation',
      svgPath: "assets/img/home/paint.svg",
    ),
    const ElevatorIconContainer(
      name: 'Fire Fighting Systems',
      svgPath: "assets/img/home/fire.svg",
    ),
    const ElevatorIconContainer(
      name: 'Other',
      svgPath: "assets/img/home/add.svg",
    ),
    const ElevatorIconContainer(
      name: 'Emergency Services',
      svgPath: "assets/img/home/alert.svg",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: SafeArea(
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
                          hintText: "Search for ‘Air conditioning maintenance’",
                          leading:
                              SvgPicture.asset("assets/img/home/search.svg"),
                          constraints: BoxConstraints(
                              minWidth: MediaQuery.sizeOf(context).width,
                              minHeight: 52),
                        ),
                      ),
                      const SizedBox(
                        height: AppSpacing.x2,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconContainer(
                                name: "Electrical Systems",
                                svgPath: "assets/img/home/electrical.svg",
                              ),
                              SizedBox(
                                width: 24,
                              ),
                              IconContainer(
                                name: "Plumbing Systems",
                                svgPath: "assets/img/home/plumber.svg",
                              ),
                              SizedBox(
                                width: 24,
                              ),
                              IconContainer(
                                name: "Air Conditioning",
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
                            return const Column(
                              children: [
                                ElevatorIconContainer(
                                  name: 'Control And Automation',
                                  svgPath: "assets/img/home/paint.svg",
                                ),
                                SizedBox(
                                  height: 24,
                                ),
                                ElevatorIconContainer(
                                  name: 'Fire Fighting Systems',
                                  svgPath: "assets/img/home/fire.svg",
                                ),
                                SizedBox(
                                  height: 24,
                                ),
                                ElevatorIconContainer(
                                  name: 'Other',
                                  svgPath: "assets/img/home/add.svg",
                                ),
                                SizedBox(
                                  height: 24,
                                ),
                                ElevatorIconContainer(
                                  name: 'Emergency Services',
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
                                  return services[index];
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
                        CarouselSlider(
                          options: CarouselOptions(
                              height: 143.0,
                              initialPage: 0,
                              enlargeFactor: 0,
                              padEnds: false,
                              enableInfiniteScroll: false),
                          items: [1, 2, 3, 4, 5].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  padding: EdgeInsets.zero,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  decoration: BoxDecoration(
                                      color: AppColors.neutral50,
                                      borderRadius:
                                          BorderRadius.circular(AppRadii.lg),
                                      border: Border.all(
                                          color: AppColors.neutralRefix)),
                                );
                              },
                            );
                          }).toList(),
                        )
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
                                    "You want service that is not available",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: AppTextSize.two.toDouble()),
                                  ),
                                  Text(
                                    "You have issue or service you want that is not available in the options",
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
                          text: "Chat with us",
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppSpacing.lg,
                ),
                Container(
                  color: AppColors.white,
                  padding: const EdgeInsets.all(AppSpacing.x),
                  child: Container(
                    height: 367,
                    decoration: BoxDecoration(
                        color: AppColors.neutral50,
                        borderRadius: BorderRadius.circular(AppRadii.lg),
                        border: Border.all(color: AppColors.neutralRefix)),
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
                        CarouselSlider(
                          options: CarouselOptions(
                              height: 143.0,
                              initialPage: 0,
                              enlargeFactor: 0,
                              padEnds: false,
                              enableInfiniteScroll: false),
                          items: [1, 2, 3, 4, 5].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  padding: EdgeInsets.zero,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  decoration: BoxDecoration(
                                      color: AppColors.neutral50,
                                      borderRadius:
                                          BorderRadius.circular(AppRadii.lg),
                                      border: Border.all(
                                          color: AppColors.neutralRefix)),
                                );
                              },
                            );
                          }).toList(),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
