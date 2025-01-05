import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:refix/src/core/localization/domain.dart';
import 'package:refix/src/core/ui/theme/colors.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/core/ui/widgets/button.dart';
import 'package:refix/src/screens/boarding/data/boarding_data.dart';

class BookingdoneScreen extends StatelessWidget {
  const BookingdoneScreen(
      {super.key,
      required this.discount,
      required this.cost,
      required this.pointsPercentage});
  final Discount discount;
  final double cost;
  final int pointsPercentage;

  String calculateCost() {
    if (pointsPercentage != 0) {
      return "${cost * (pointsPercentage / 100)}";
    }
    if (discount.discount != null) {
      return "${cost * (discount.discount! / 100)}";
    }

    return "$cost";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.tr.payment_methods,
          style: const TextStyle(fontSize: AppTextSize.two),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            "assets/img/services/present_lottie.json",
          ),
          const SizedBox(
            height: 48,
          ),
          Text(
            discount.heading?.localized ?? "",
            style: const TextStyle(
                fontSize: AppTextSize.six, fontWeight: FontWeight.w700),
          ),
          Text(
            discount.details?.localized ?? "",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: AppTextSize.one.toDouble()),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: 58,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppRadii.lg),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.tr.costOfService,
                    style: const TextStyle(fontSize: AppTextSize.two),
                  ),
                  pointsPercentage != 0
                      ? Row(
                          spacing: 16,
                          children: [
                            Text(
                              context.tr.cost(calculateCost()),
                              style: const TextStyle(fontSize: AppTextSize.two),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              color: AppColors.primary100,
                              alignment: Alignment.center,
                              child: Text(
                                "$pointsPercentage% Offer",
                                style: const TextStyle(
                                    color: AppColors.primaryRefix),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        )
                      : Text(
                          context.tr.cost(calculateCost()),
                          style: const TextStyle(fontSize: AppTextSize.two),
                        ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: PrimaryButton(
                text: context.tr.choosePaymentMethod,
                onPressed: () => context.push("/payment_method")),
          )
        ],
      ),
    );
  }
}
