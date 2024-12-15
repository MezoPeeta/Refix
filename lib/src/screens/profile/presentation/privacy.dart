import 'package:flutter/material.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/screens/profile/presentation/profile.dart';

import '../../../core/ui/theme/colors.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: AppColors.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Discounts and Updates",
                    style: TextStyle(fontSize: AppTextSize.three),
                  ),
                  ProfileOption(
                    title: "SMS Message",
                    trailing: Switch.adaptive(
                        inactiveTrackColor: AppColors.white,
                        activeTrackColor: AppColors.primaryRefix,
                        value: true,
                        onChanged: (value) {}),
                  ),
                  const Divider(
                    color: AppColors.neutralRefix,
                  ),
                  ProfileOption(
                    title: "Email",
                    trailing: Switch.adaptive(
                        inactiveTrackColor: AppColors.white,
                        activeTrackColor: AppColors.primaryRefix,
                        value: false,
                        onChanged: (value) {}),
                  ),
                  const Divider(
                    color: AppColors.neutralRefix,
                  ),
                  ProfileOption(
                    title: "Pop-Up Notifications",
                    trailing: Switch.adaptive(
                        inactiveTrackColor: AppColors.white,
                        activeTrackColor: AppColors.primaryRefix,
                        value: true,
                        onChanged: (value) {}),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              color: AppColors.white,
              padding: const EdgeInsets.all(16),
              child: ProfileOption(
                title: "Share Location",
                trailing: Switch.adaptive(
                    inactiveTrackColor: AppColors.white,
                    activeTrackColor: AppColors.primaryRefix,
                    value: true,
                    onChanged: (value) {}),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Location sharing helps the driver provide you with better services. If location sharing is disabled, the driver will not be able to see your location in real-time.",
                style: TextStyle(
                    color: AppColors.neutralRefix, fontWeight: FontWeight.w300),
              ),
            ),
            Container(
              color: AppColors.white,
              padding: const EdgeInsets.all(16),
              child: const ProfileOption(
                title: "Access permissions to the system",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
