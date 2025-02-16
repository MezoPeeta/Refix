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
import '../domain/services_domain.dart';

final serviceProvider = StateProvider<List<Service>>((ref) {
  return [];
});

class ServicesScreen extends ConsumerStatefulWidget {
  const ServicesScreen({super.key, required this.name, required this.type});

  final String name;
  final String type;

  @override
  ConsumerState<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends ConsumerState<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    final services = ref.watch(getSubServicesProvider(type: widget.type));
    final avgRating =
        ref.watch(getAvgReviewsProvider(type: widget.type)).value ?? 0.0;
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
                          iconSize: 10,
                          alignment: Alignment.center,
                          padding:
                              ref.watch(localeNotifierProvider).languageCode ==
                                      "en"
                                  ? const EdgeInsets.only(left: 8)
                                  : const EdgeInsets.only(right: 8),
                          onPressed: () => context.pop(),
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                          )),
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
                    onTap: () => context.push("/reviews", extra: widget.type),
                    child: Row(
                      children: [
                        Container(
                          height: 32,
                          width: 79,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppRadii.md),
                            color: AppColors.primaryRefix,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.star_rounded,
                                color: AppColors.white,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                "$avgRating",
                                style: const TextStyle(
                                  color: AppColors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
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
                                isSelected: false,
                                onPressed: () {
                                  // ref.read(serviceProvider.notifier).state =
                                  //     data[index].childService;
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
            context.pushNamed("moreServices",
                pathParameters: {"name": widget.name, "type": widget.type});
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
        onTap: onPressed,
        child: Column(
          children: [
            Container(
              height: 52,
              width: isSelected ? 110.67 : 116.67,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                        
                          "https://api.refixapp.com/${service.image}")),
                  borderRadius: BorderRadius.circular(AppRadii.lg),
                  color: isSelected
                      ? AppColors.primaryRefix
                      : AppColors.neutral100),
            ),
            SizedBox(height: isSelected ? 5 : 13),
            FittedBox(child: Text(service.name.localized))
          ],
        ),
      ),
    );
  }
}
