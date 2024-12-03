import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:refix/src/core/navigation/routes.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/core/ui/widgets/button.dart';
import 'package:refix/src/screens/services/presentation/final_step.dart';

import '../../../core/ui/theme/colors.dart';
import '../../../core/ui/widgets/header.dart';

class InbookingScreen extends StatelessWidget {
  const InbookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextHeader(
                text: "Select Service Name",
                fontWeight: FontWeight.w500,
              ),
              const Text(
                "If you have any questions, please fill in the input box below.If you have any questions, please fill in the input box below.",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: AppTextSize.one,
                    color: AppColors.neutralRefix),
              ),
              const SizedBox(height: 24),
              const SizedBox(
                height: 24,
              ),
              const TextHeader(
                text: "Photo your problem",
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  const AddedImage(),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    width: 77,
                    height: 80,
                    decoration: BoxDecoration(
                        color: AppColors.neutral100,
                        borderRadius: BorderRadius.circular(AppRadii.lg)),
                    child: SvgPicture.asset(
                      "assets/img/home/add_disabled.svg",
                      width: 39,
                      height: 39,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const TextHeader(
                text: "Select Service Name",
                fontWeight: FontWeight.w500,
              ),
              const Text(
                "If you have any questions, please fill in the input box below.If you have any questions, please fill in the input box below.",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: AppTextSize.one,
                    color: AppColors.neutralRefix),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Add Address",
                    filled: true,
                    suffixIcon: SvgPicture.asset(
                      "assets/img/services/location.svg",
                      width: 11,
                      fit: BoxFit.scaleDown,
                    )),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                onTap: () {
                  showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 50)));
                },
                readOnly: true,
                decoration: InputDecoration(
                    hintText: "Pick Date",
                    suffixIcon: SvgPicture.asset(
                      "assets/img/services/calendar.svg",
                      width: 11,
                      fit: BoxFit.scaleDown,
                    )),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PrimaryButton(text: "Add Note For Worker", onPressed: () {}),
            const SizedBox(
              height: AppSpacing.x,
            ),
            TextButton(
                onPressed: () => context.push("/cancel_booking"),
                child: const Text(
                  "Cancel Booking",
                  style: TextStyle(
                      color: AppColors.errorRefix,
                      fontSize: AppTextSize.three,
                      fontWeight: FontWeight.w500),
                ))
          ],
        ),
      ),
    );
  }
}
