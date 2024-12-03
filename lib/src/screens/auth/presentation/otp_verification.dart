import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:refix/src/core/ui/widgets/button.dart';

import '../../../core/ui/theme/colors.dart';
import '../../../core/ui/theme/radii.dart';

class OtpVerification extends StatelessWidget {
  const OtpVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "OTP Verification",
              style: TextStyle(
                  fontSize: AppTextSize.six, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Enter the verification code we just sent on your phone Number +966XXX XXX XXXX",
              style: TextStyle(fontSize: AppTextSize.two),
            ),
            const SizedBox(
              height: 32,
            ),
            Pinput(
              length: 4,
              defaultPinTheme: PinTheme(
                  width: MediaQuery.sizeOf(context).width,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.neutral50)),
            ),
            const SizedBox(
              height: 16,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Resend Code After",
                  style: TextStyle(
                      fontSize: AppTextSize.one, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: 3,
                ),
                Text(
                  "32 S",
                  style: TextStyle(
                      fontSize: AppTextSize.one,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryRefix),
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            PrimaryButton(text: "Confirm", onPressed: () {})
          ],
        ),
      ),
    );
  }
}
