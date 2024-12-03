import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:refix/src/core/ui/theme/colors.dart';
import 'package:refix/src/core/ui/theme/radii.dart';

import '../../../core/ui/widgets/button.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  static var services = [
    "Services",
    "Services",
    "Services",
    "Services",
    "Other",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutral50,
      body: SafeArea(
        child: Container(
          color: AppColors.white,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          "assets/img/boarding/boarding2.jpg",
                          height: 232,
                          width: MediaQuery.sizeOf(context).width,
                          fit: BoxFit.cover,
                        ),
                        Center(
                          child: Text(
                            "Electrical Systems",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: AppColors.white,
                                fontSize: AppTextSize.four.toDouble()),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: IconButton.filled(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(left: 8),
                          onPressed: () => context.pop(),
                          icon: const Icon(Icons.arrow_back_ios)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "Electrical Systems",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: AppTextSize.four.toDouble()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: GestureDetector(
                    onTap: () => context.push("/reviews"),
                    child: Row(
                      children: [
                        Container(
                          height: 32,
                          width: 79,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppRadii.md),
                            color: AppColors.primaryRefix,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star_rounded,
                                color: AppColors.white,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "4.77",
                                style: TextStyle(
                                  color: AppColors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          "45K Reviews",
                          style:
                              TextStyle(fontSize: AppTextSize.one.toDouble()),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    padding: const EdgeInsets.all(AppSpacing.x),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppRadii.lg),
                        color: AppColors.neutral50),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/img/services/star.svg"),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Text(
                            "Get 40% discount if you order now",
                            style: TextStyle(
                                fontSize: AppTextSize.three.toDouble(),
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: services.length,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              crossAxisSpacing: 24,
                              mainAxisSpacing: 24,
                              maxCrossAxisExtent: 116.67),
                      itemBuilder: (context, index) {
                        return ServiceContainer(
                          name: services[index],
                        );
                      },
                    ))
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: PrimaryButton(
          text: "Order Now",
          onPressed: () {},
        ),
      ),
    );
  }
}

class ServiceContainer extends StatefulWidget {
  const ServiceContainer({super.key, required this.name});

  final String name;

  @override
  State<ServiceContainer> createState() => _ServiceContainerState();
}

class _ServiceContainerState extends State<ServiceContainer> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(AppRadii.md),
      padding: isSelected ? const EdgeInsets.all(8) : EdgeInsets.zero,
      color: isSelected ? AppColors.primaryRefix : Colors.transparent,
      child: GestureDetector(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: Column(
          children: [
            Container(
              height: 52,
              width: isSelected ? 110.67 : 116.67,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadii.lg),
                  color: isSelected
                      ? AppColors.primaryRefix
                      : AppColors.neutral100),
            ),
            SizedBox(height: isSelected ? 5 : 13),
            Text(widget.name)
          ],
        ),
      ),
    );
  }
}
