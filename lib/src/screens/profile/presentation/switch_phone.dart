import 'package:flutter/material.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/core/ui/widgets/button.dart';

import '../../../core/ui/theme/colors.dart';

class SwitchPhone extends StatelessWidget {
  const SwitchPhone({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Switch To New Number"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "The currently registered mobile number is 0114****42 Your balance data and other account-related information will not be affected.",
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
