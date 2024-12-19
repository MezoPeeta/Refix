import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:refix/src/core/ui/theme/colors.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/screens/home/data/home_data.dart';
import 'package:refix/src/screens/home/domain/home_domain.dart';

import '../../../core/ui/widgets/button.dart';
import 'more_services.dart';

class ServicesScreen extends ConsumerWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final services = ref.watch(getAllServicesProvider);
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
                          "assets/img/home/Image.png",
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
                services.when(
                    data: (data) {
                      data.add(const Service(
                          name: "Other",
                          details: "details",
                          id: "",
                          price: 0,
                          isActive: false,
                          childService: [],
                          image: "",
                          v: 0));
                      return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: data.length,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    crossAxisSpacing: 24,
                                    mainAxisSpacing: 24,
                                    maxCrossAxisExtent: 116.67),
                            itemBuilder: (context, index) {
                              return ServiceContainer(
                                service: data[index],
                                onPressed: () {
                                  ref.read(choosenService.notifier).state =
                                      data[index];
                                  ref.read(serviceProvider.notifier).state =
                                      data[index].childService;
                                },
                              );
                            },
                          ));
                    },
                    error: (e, s) => const Center(child: Text("Error")),
                    loading: () => const CircularProgressIndicator.adaptive())
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: PrimaryButton(
          text: "Order Now",
          onPressed: () => context.push(
            "/more_services",
          ),
        ),
      ),
    );
  }
}

class ServiceContainer extends ConsumerStatefulWidget {
  const ServiceContainer(
      {super.key, required this.service, required this.onPressed});

  final Service service;
  final VoidCallback onPressed;

  @override
  ConsumerState<ServiceContainer> createState() => _ServiceContainerState();
}

class _ServiceContainerState extends ConsumerState<ServiceContainer> {
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
          widget.onPressed();
        },
        child: Column(
          children: [
            Container(
              height: 52,
              width: isSelected ? 110.67 : 116.67,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                          "https://refix-api.onrender.com/${widget.service.image}")),
                  borderRadius: BorderRadius.circular(AppRadii.lg),
                  color: isSelected
                      ? AppColors.primaryRefix
                      : AppColors.neutral100),
            ),
            SizedBox(height: isSelected ? 5 : 13),
            FittedBox(child: Text(widget.service.name))
          ],
        ),
      ),
    );
  }
}
