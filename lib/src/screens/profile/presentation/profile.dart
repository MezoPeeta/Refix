import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:refix/src/core/ui/theme/colors.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/screens/auth/domain/auth_domain.dart';

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
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => context.push("/profile"),
                        child: const ProfileOption(
                          title: "Your Profile",
                        ),
                      ),
                      const Divider(
                        color: AppColors.neutral300,
                      ),
                      const ProfileOption(
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
                  child: Column(
                    children: [
                      const ProfileOption(
                        title: "Application Language",
                        trailing: Text(
                          "English",
                          style: TextStyle(fontSize: AppTextSize.two),
                        ),
                      ),
                      const Divider(
                        color: AppColors.neutral300,
                      ),
                      GestureDetector(
                        onTap: () => context.push("/privacy"),
                        child: const ProfileOption(
                          title: "Privacy",
                        ),
                      ),
                      const Divider(
                        color: AppColors.neutral300,
                      ),
                      const ProfileOption(
                        title: "Terms And Conditions",
                      ),
                      const Divider(
                        color: AppColors.neutral300,
                      ),
                      GestureDetector(
                        onTap: () => context.push("/about"),
                        child: const ProfileOption(
                          title: "About Refix",
                        ),
                      ),
                      const Divider(
                        color: AppColors.neutral300,
                      ),
                      const ProfileOption(
                        title: "Be A Part Of Refix",
                      ),
                      const Divider(
                        color: AppColors.neutral300,
                      ),
                      Consumer(builder: (context, ref, child) {
                        return GestureDetector(
                          onTap: () {
                            ref.read(authProvider).logout();
                            context.go("/login");
                          },
                          child: const ProfileOption(
                            title: "Logout",
                            titleColor: AppColors.errorRefix,
                            trailing: SizedBox.shrink(),
                          ),
                        );
                      }),
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
