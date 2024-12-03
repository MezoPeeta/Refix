import 'package:flutter/material.dart';
import 'package:refix/src/core/ui/widgets/button.dart';

import '../../../core/ui/theme/colors.dart';
import '../../../core/ui/theme/radii.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

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
              "Forget Password?",
              style: TextStyle(
                  fontSize: AppTextSize.six, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Don't worry! It occurs. Please enter the email address linked with your account.",
              style: TextStyle(fontSize: AppTextSize.two),
            ),
            const SizedBox(
              height: 32,
            ),
            TextFormField(
                decoration: const InputDecoration(label: Text("Phone Number"))),
            const SizedBox(
              height: 32,
            ),
            PrimaryButton(text: "Send Code", onPressed: () {})
          ],
        ),
      ),
    );
  }
}
