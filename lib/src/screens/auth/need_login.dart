import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:refix/src/core/ui/theme/colors.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/core/ui/widgets/button.dart';

class NeedLoginScreen extends StatelessWidget {
  const NeedLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/img/login/need_login.svg"),
            const Text(
              "You Need Login To Complete",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            Text(
              "This sentence is used as a substitute for real text in the fields of printing and design.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: AppTextSize.one.toDouble()),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              PrimaryButton(text: "Create new Account", onPressed: () {}),
              const SizedBox(
                height: AppSpacing.x,
              ),
              SecondaryButton(text: "Sign In", onPressed: () {})
            ],
          ),
        ));
  }
}
