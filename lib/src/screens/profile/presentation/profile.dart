import 'package:flutter/material.dart';
import 'package:refix/src/core/ui/theme/colors.dart';
import 'package:refix/src/core/ui/theme/radii.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(AppRadii.lg)),
                  child: const Column(
                    children: [
                      ProfileOption(
                        title: "Your Profile",
                      ),
                      Divider(
                        color: AppColors.neutral300,
                      ),
                      ProfileOption(
                        title: "Payment Methods",
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(AppRadii.lg)),
                  child: const Column(
                    children: [
                      ProfileOption(
                        title: "Application Language",
                        trailing: Text(
                          "English",
                          style: TextStyle(fontSize: AppTextSize.two),
                        ),
                      ),
                      Divider(
                        color: AppColors.neutral300,
                      ),
                      ProfileOption(
                        title: "Privacy",
                      ),
                      Divider(
                        color: AppColors.neutral300,
                      ),
                      ProfileOption(
                        title: "Terms And Conditions",
                      ),
                      Divider(
                        color: AppColors.neutral300,
                      ),
                      ProfileOption(
                        title: "About Refix",
                      ),
                      Divider(
                        color: AppColors.neutral300,
                      ),
                      ProfileOption(
                        title: "Be A Part Of Refix",
                      ),
                      Divider(
                        color: AppColors.neutral300,
                      ),
                      ProfileOption(
                        title: "Logout",
                        titleColor: AppColors.errorRefix,
                        trailing: SizedBox.shrink(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  const ProfileOption({
    super.key,
    required this.title,
    this.titleColor,
    this.trailing,
  });
  final String title;
  final Widget? trailing;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: TextStyle(fontSize: AppTextSize.two, color: titleColor),
      ),
      trailing: trailing ??
          const Icon(
            Icons.arrow_forward_ios_outlined,
            size: 16,
            color: AppColors.neutral300,
          ),
    );
  }
}
