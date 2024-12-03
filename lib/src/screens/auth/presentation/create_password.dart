import 'package:flutter/material.dart';
import 'package:refix/src/core/ui/theme/radii.dart';

import '../../../core/ui/theme/colors.dart';
import '../../../core/ui/widgets/button.dart';

class CreatePasswordScreen extends StatelessWidget {
  const CreatePasswordScreen({super.key});

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
          children: [
            const Text(
              "Create New Password",
              style: TextStyle(
                  fontSize: AppTextSize.six, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Your new password must be unique from those previously used.",
              style: TextStyle(fontSize: AppTextSize.two),
            ),
            const SizedBox(
              height: 32,
            ),
            TextFormField(
                obscureText: true,
                decoration: const InputDecoration(label: Text("New Password"))),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
                obscureText: true,
                decoration: const InputDecoration(label: Text("New Password"))),
            const SizedBox(
              height: 32,
            ),
            PrimaryButton(text: "Reset Password", onPressed: () {})
          ],
        ),
      ),
    );
  }
}
