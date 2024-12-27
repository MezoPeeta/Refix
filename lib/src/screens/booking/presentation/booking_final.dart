import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:refix/src/core/ui/theme/colors.dart';
import 'package:refix/src/core/ui/widgets/button.dart';

import '../../../core/ui/theme/radii.dart';

class BookingFinalDone extends StatelessWidget {
  const BookingFinalDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text(
              "English Arabic 3",
              style: TextStyle(fontSize: AppTextSize.two),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/img/services/progress_fill.svg"),
                const SizedBox(
                  width: 16,
                ),
                SvgPicture.asset("assets/img/services/progress_fill.svg"),
                const SizedBox(
                  width: 16,
                ),
                SvgPicture.asset("assets/img/services/progress_fill.svg")
              ],
            )
          ],
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              SvgPicture.asset("assets/img/check.svg"),
              const Text(
                "Booking Done",
                style: TextStyle(
                    fontSize: AppTextSize.six, fontWeight: FontWeight.w700),
              ),
              const Text(
                "Your reservation has been added, and you will be contacted soon to confirm the reservation at the phone number we have on file.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: AppTextSize.two,
                    color: AppColors.neutralRefix,
                    fontWeight: FontWeight.w300),
              ),
              PrimaryButton(
                  text: "Show your booking", onPressed: () => context.go("/")),
              SecondaryButton(
                  text: "Back to home", onPressed: () => context.go("/"))
            ],
          ),
        ),
      ),
    );
  }
}
