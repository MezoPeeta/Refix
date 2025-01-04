import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:refix/src/core/localization/domain.dart';
import 'package:refix/src/core/ui/theme/colors.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/screens/auth/domain/auth_domain.dart';
import 'package:refix/src/screens/points/domain/points_domain.dart';

class PointsScreen extends ConsumerWidget {
  const PointsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final points = ref.watch(getUserPointsProvider);
    final balance = ref.watch(getCurrentUserProvider).value?.points ?? 0;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(AppRadii.lg)),
                child: Column(
                  children: [
                    Text(
                      balance.toString(),
                      style: const TextStyle(fontSize: AppTextSize.eight),
                    ),
                    Text(
                      context.tr.pointsBalance,
                      style: const TextStyle(fontSize: AppTextSize.three),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            points.when(
                data: (data) {
                  return Expanded(
                    child: ListView.separated(
                        itemCount: data.length,
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 16,
                            ),
                        itemBuilder: (context, index) {
                          return PointContainer(
                            percentage: data[index].percentage,
                            name: data[index].name.localized,
                            isActive: data[index].active,
                            requiredPoints: data[index].requiredPoints,
                            availableDays: data[index].availableDays,
                          );
                        }),
                  );
                },
                error: (e, s) {
                  return const Text("Error");
                },
                loading: () =>
                    const Center(child: CircularProgressIndicator.adaptive()))
          ],
        ),
      ),
    );
  }
}

class PointContainer extends StatelessWidget {
  const PointContainer({
    super.key,
    required this.percentage,
    required this.name,
    required this.availableDays,
    required this.isActive,
    required this.requiredPoints,
  });

  final int percentage, availableDays, requiredPoints;
  final String name;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppRadii.lg)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  "assets/img/services/star.svg",
                  colorFilter: ColorFilter.mode(
                      isActive
                          ? AppColors.primaryRefix
                          : AppColors.neutralRefix,
                      BlendMode.srcIn),
                ),
                Text(
                  "$percentage%",
                  style: TextStyle(
                      fontSize: AppTextSize.eight,
                      color: isActive
                          ? AppColors.primaryRefix
                          : AppColors.neutralRefix),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppRadii.lg),
                      color: isActive
                          ? AppColors.primaryRefix
                          : AppColors.neutralRefix),
                  child: Text(
                    "$requiredPoints ${context.tr.points}",
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              name,
              style: const TextStyle(
                  fontSize: AppTextSize.three, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              context.tr.endsWithin(availableDays.toString()),
              style: const TextStyle(
                  color: AppColors.neutral300,
                  fontSize: AppTextSize.two,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
