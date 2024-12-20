import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:refix/src/core/ui/theme/colors.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/core/ui/widgets/button.dart';

class BookingdoneScreen extends StatelessWidget {
  const BookingdoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Payment Methods",
          style: TextStyle(fontSize: AppTextSize.two),
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
          const Text(
            "Get 50% discount",
            style: TextStyle(
                fontSize: AppTextSize.six, fontWeight: FontWeight.w700),
          ),
          Text(
            "When you add your bank card for the first time, you get a 50% discount on all services.",
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
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Cost Of Service",
                    style: TextStyle(fontSize: AppTextSize.two),
                  ),
                  Text(
                    "12.5 SAR",
                    style: TextStyle(fontSize: AppTextSize.two),
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
            child:
                PrimaryButton(text: "Choose Payment Method", onPressed: () {}),
          )
        ],
      ),
    );
  }
}
