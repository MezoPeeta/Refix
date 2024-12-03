import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:refix/src/core/ui/theme/colors.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/screens/points/presentation/container.dart';
import 'package:ticket_widget/ticket_widget.dart';

class PointsScreen extends StatelessWidget {
  const PointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                  child: const Column(
                    children: [
                      Text(
                        "33.55",
                        style: TextStyle(fontSize: AppTextSize.eight),
                      ),
                      Text(
                        "Points Balance",
                        style: TextStyle(fontSize: AppTextSize.three),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const PointContainer(),
              const SizedBox(
                height: 16,
              ),
              const PointContainer(),
              const SizedBox(
                height: 16,
              ),
              const PointContainer()
            ],
          ),
        ),
      ),
    );
  }
}

class PointContainer extends StatelessWidget {
  const PointContainer({
    super.key,
  });

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
                SvgPicture.asset("assets/img/services/star.svg"),
                const Text(
                  "30%",
                  style: TextStyle(
                      fontSize: AppTextSize.eight,
                      color: AppColors.primaryRefix),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppRadii.lg),
                      color: AppColors.primaryRefix),
                  child: const Text(
                    "20 Points",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            const Text(
              "Package Name",
              style: TextStyle(
                  fontSize: AppTextSize.three, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Ends within 30 days",
              style: TextStyle(
                  color: AppColors.neutral300,
                  fontSize: AppTextSize.two,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Figma ipsum component variant main laye.Figma ipsum component variant main laye.Figma ipsum component variant main laye.",
              style: TextStyle(
                color: AppColors.neutral300,
                fontSize: AppTextSize.one,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
