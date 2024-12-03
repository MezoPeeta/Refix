import 'package:flutter/material.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/core/ui/widgets/header.dart';

import '../../../core/ui/theme/colors.dart';
import '../../../core/ui/widgets/button.dart';

class ReportBooking extends StatelessWidget {
  const ReportBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Report The Problem Not Resolved",
          style: TextStyle(
              fontSize: AppTextSize.three, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextHeader(
              text: "Enter Report the problem not resolved",
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
              maxLength: 200,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: "Add Notes Here",
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: PrimaryButton(
          text: "Send",
          onPressed: () {},
        ),
      ),
    );
  }
}
