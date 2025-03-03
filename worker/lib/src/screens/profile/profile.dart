import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:worker/src/core/localization/domain.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/radii.dart';
import '../../core/widgets/btns.dart';
import '../auth/domain/auth_domain.dart';

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
                        onTap: () => context.push("/user/profile"),
                        child: ProfileOption(
                          title: context.tr.your_profile,
                        ),
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
                      Consumer(builder: (context, ref, child) {
                        return GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.white,
                                builder: (context) => Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: SizedBox(
                                        height: 300,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              spacing: 16,
                                              children: [
                                                Text(
                                                  context.tr.select,
                                                  style: const TextStyle(
                                                      fontSize:
                                                          AppTextSize.four),
                                                ),
                                                Directionality(
                                                  textDirection:
                                                      TextDirection.ltr,
                                                  child: ListTile(
                                                    tileColor: ref
                                                                .read(
                                                                    localeNotifierProvider)
                                                                .languageCode ==
                                                            "en"
                                                        ? AppColors.secondary50
                                                        : null,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8)),
                                                    title: const Text(
                                                      "English",
                                                      style: TextStyle(
                                                          fontSize:
                                                              AppTextSize.two),
                                                    ),
                                                    onTap: () {
                                                      ref
                                                          .read(
                                                              localeNotifierProvider
                                                                  .notifier)
                                                          .setLocale(
                                                              const Locale(
                                                                  "en"));
                                                    },
                                                  ),
                                                ),
                                                Directionality(
                                                  textDirection:
                                                      TextDirection.ltr,
                                                  child: ListTile(
                                                    tileColor: ref
                                                                .read(
                                                                    localeNotifierProvider)
                                                                .languageCode ==
                                                            "ar"
                                                        ? AppColors.secondary50
                                                        : null,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8)),
                                                    title: const Text(
                                                      "العربية",
                                                      textAlign: TextAlign.end,
                                                      style: TextStyle(
                                                          fontSize:
                                                              AppTextSize.two),
                                                    ),
                                                    onTap: () {
                                                      ref
                                                          .read(
                                                              localeNotifierProvider
                                                                  .notifier)
                                                          .setLocale(
                                                              const Locale(
                                                                  "ar"));
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            PrimaryButton(
                                                text: context.tr.save,
                                                onPressed: () => context.pop())
                                          ],
                                        ),
                                      ),
                                    ));
                          },
                          child: ProfileOption(
                            title: context.tr.language,
                            trailing: Text(
                              ref.watch(localeNotifierProvider).languageCode ==
                                      "en"
                                  ? "English"
                                  : "العربية",
                              style: const TextStyle(fontSize: AppTextSize.two),
                            ),
                          ),
                        );
                      }),
                      const Divider(
                        color: AppColors.neutral300,
                      ),
                      GestureDetector(
                        onTap: () => context.push("/about"),
                        child: ProfileOption(
                          title: context.tr.about_refix,
                        ),
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
                          child: ProfileOption(
                            title: context.tr.logout,
                            titleColor: AppColors.errorRefix,
                            trailing: const SizedBox.shrink(),
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
