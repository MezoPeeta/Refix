import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:refix/src/core/localization/domain.dart';
import 'package:refix/src/core/ui/theme/colors.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/screens/points/domain/points_domain.dart';

import '../../profile/domain/user_notifier.dart';

class PointsScreen extends ConsumerWidget {
  const PointsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final points = ref.watch(getUserPointsProvider);
    final customer = ref.watch(customerNotifierProvider).value;
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
                      customer?.points.toString() ?? "0",
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
                            id: data[index].id,
                            userHasOffer: customer?.havePointsOffer ?? false,
                            userBalance: customer?.points ?? 0,
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

class PointContainer extends ConsumerStatefulWidget {
  const PointContainer({
    super.key,
    required this.percentage,
    required this.name,
    required this.availableDays,
    required this.userBalance,
    required this.isActive,
    required this.id,
    required this.requiredPoints,
    this.userHasOffer = false,
  });

  final int percentage, availableDays, requiredPoints, userBalance;
  final String name, id;
  final bool isActive, userHasOffer;

  @override
  ConsumerState<PointContainer> createState() => _PointContainerState();
}

class _PointContainerState extends ConsumerState<PointContainer> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: () async {
          if (widget.userHasOffer) {
            return showAdaptiveDialog(
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: 100,
                    child: AlertDialog.adaptive(
                      content: const Text("You already have an offer, you can't claim another one"),
                      actions: [
                        TextButton(
                            onPressed: () => context.pop(),
                            child: Text(context.tr.backButton))
                      ],
                    ),
                  );
                });
          }
          if (widget.userBalance >= widget.requiredPoints) {
            setState(() {
              loading = true;
            });
            final status =
                await ref.read(claimPointsProvider(pointsID: widget.id).future);

            if (status == 201) {
              if (!context.mounted) return;
              context.push("/redeem", extra: widget.percentage.toString());
              ref.invalidate(customerNotifierProvider);
            }
            setState(() {
              loading = false;
            });
          }
        },
        child: loading
            ? const Center(child: CircularProgressIndicator.adaptive())
            : Container(
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
                              widget.isActive
                                  ? AppColors.primaryRefix
                                  : AppColors.neutralRefix,
                              BlendMode.srcIn),
                        ),
                        Text(
                          "${widget.percentage}%",
                          style: TextStyle(
                              fontSize: AppTextSize.eight,
                              color: widget.isActive
                                  ? AppColors.primaryRefix
                                  : AppColors.neutralRefix),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppRadii.lg),
                              color: widget.isActive
                                  ? AppColors.primaryRefix
                                  : AppColors.neutralRefix),
                          child: Text(
                            "${widget.requiredPoints} ${context.tr.points}",
                            style: const TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Text(
                      widget.name,
                      style: const TextStyle(
                          fontSize: AppTextSize.three,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      context.tr.endsWithin(widget.availableDays.toString()),
                      style: const TextStyle(
                          color: AppColors.neutral300,
                          fontSize: AppTextSize.two,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
