import 'package:flutter/material.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/core/ui/widgets/button.dart';

import '../../../core/ui/theme/colors.dart';

class SwitchEmail extends StatelessWidget {
  const SwitchEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Email Subject"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "The currently registered email is m***@gmail.com Your balance data and other account-related information will not be affected.",
              style: TextStyle(
                  color: AppColors.neutralRefix, fontSize: AppTextSize.one),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: PrimaryButton(text: "Switch Now", onPressed: () {}),
      ),
    );
  }
}
