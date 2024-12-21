import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:refix/src/core/localization/domain.dart';
import 'package:refix/src/core/ui/theme/colors.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/screens/home/data/home_data.dart';
import 'package:refix/src/screens/home/domain/home_domain.dart';

import '../../../core/ui/widgets/button.dart';

final serviceProvider = StateProvider<List<Service>>((ref) {
  return [];
});

class ServicesScreen extends ConsumerStatefulWidget {
  const ServicesScreen({super.key, required this.name});

  final String name;

  @override
  ConsumerState<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends ConsumerState<ServicesScreen> {
  int? selectedServiceIndex;
  Service? selectedService;

  @override
  Widget build(BuildContext context) {
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
                          color: AppColors.black.withValues(alpha: 0.5),
                          colorBlendMode: BlendMode.darken,
                          width: MediaQuery.sizeOf(context).width,
                          fit: BoxFit.cover,
                        ),
                        Center(
                          child: Text(
                            widget.name,
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
                          padding: const EdgeInsets.symmetric(horizontal: 8),
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
                    widget.name,
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
                          "45K ${context.tr.reviews}",
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
                            context.tr.get_discount("40%"),
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
                                isSelected: selectedServiceIndex == index,
                                onPressed: () {
                                  setState(() {
                                    selectedServiceIndex = index;
                                    selectedService = data[index];
                                  });
                                  ref.read(serviceProvider.notifier).state =
                                      data[index].childService;
                                },
                              );
                            },
                          ));
                    },
                    error: (e, s) => const Center(child: Text("Error")),
                    loading: () => const Center(
                        child: CircularProgressIndicator.adaptive()))
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: PrimaryButton(
          text: context.tr.order_now,
          onPressed: () {
            if (selectedService != null) {
              context.pushNamed("moreServices",
                  extra: selectedService!.childService,
                  pathParameters: {"name": selectedService!.name});
              return;
            }
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(context.tr.choose_service)));
          },
        ),
      ),
    );
  }
}

class ServiceContainer extends StatelessWidget {
  const ServiceContainer(
      {super.key,
      required this.service,
      required this.onPressed,
      this.isSelected = false});

  final Service service;
  final VoidCallback onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(AppRadii.md),
      padding: isSelected ? const EdgeInsets.all(8) : EdgeInsets.zero,
      color: isSelected ? AppColors.primaryRefix : Colors.transparent,
      child: GestureDetector(
        onTap: () {
          onPressed();
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
                          "https://refix-api.onrender.com/${service.image}")),
                  borderRadius: BorderRadius.circular(AppRadii.lg),
                  color: isSelected
                      ? AppColors.primaryRefix
                      : AppColors.neutral100),
            ),
            SizedBox(height: isSelected ? 5 : 13),
            FittedBox(child: Text(service.name))
          ],
        ),
      ),
    );
  }
}
