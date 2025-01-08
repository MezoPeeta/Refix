import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:refix/src/core/localization/domain.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/screens/profile/domain/permissions.dart';
import 'package:refix/src/screens/profile/presentation/profile.dart';
import '../../../core/ui/theme/colors.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr.privacy),
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
                  Text(
                    context.tr.discounts_and_updates,
                    style: const TextStyle(fontSize: AppTextSize.three),
                  ),
                  Consumer(builder: (context, ref, child) {
                    final isGranted =
                        ref.watch(getSMSPermissionProvider).value ?? false;
                    return ProfileOption(
                      title: context.tr.sms_message,
                      trailing: Switch.adaptive(
                          inactiveTrackColor: AppColors.white,
                          activeTrackColor: AppColors.primaryRefix,
                          value: isGranted,
                          onChanged: (value) {
                            Permission.sms.request();
                          }),
                    );
                  }),
                  const Divider(
                    color: AppColors.neutralRefix,
                  ),
                  Consumer(builder: (context, ref, child) {
                    final isGranted =
                        ref.watch(getNotificationPermissionProvider).value ??
                            false;
                    return ProfileOption(
                      title: context.tr.pop_up_notifications,
                      trailing: Switch.adaptive(
                          inactiveTrackColor: AppColors.white,
                          activeTrackColor: AppColors.primaryRefix,
                          value: isGranted,
                          onChanged: (value) async {
                            Permission.notification.request();
                          }),
                    );
                  }),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Consumer(builder: (context, ref, child) {
              final isGranted =
                  ref.watch(getLocationPermissionProvider).value ?? false;
              return Container(
                color: AppColors.white,
                padding: const EdgeInsets.all(16),
                child: ProfileOption(
                  title: context.tr.share_locations,
                  trailing: Switch.adaptive(
                      inactiveTrackColor: AppColors.white,
                      activeTrackColor: AppColors.primaryRefix,
                      value: isGranted,
                      onChanged: (value) {}),
                ),
              );
            }),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                context.tr.location_sharing_info,
                style: const TextStyle(
                    color: AppColors.neutralRefix, fontWeight: FontWeight.w300),
              ),
            ),
            GestureDetector(
              onTap: () {
                openAppSettings();
              },
              child: Container(
                color: AppColors.white,
                padding: const EdgeInsets.all(16),
                child: ProfileOption(
                  title: context.tr.access_permissions_to_the_system,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
