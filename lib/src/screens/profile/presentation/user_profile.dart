import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:refix/src/core/localization/domain.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/core/ui/widgets/button.dart';
import 'package:refix/src/screens/profile/domain/user_notifier.dart';
import 'package:refix/src/screens/profile/presentation/profile.dart';

import '../../../core/ui/theme/colors.dart';
import '../../auth/domain/auth_domain.dart';

class UserProfile extends ConsumerWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(customerNotifierProvider).value;
    final userController = TextEditingController(text: user?.username);
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr.your_profile),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(AppRadii.lg)),
                child: TextFormField(
                  readOnly: true,
                  controller: userController,
                  decoration: InputDecoration(
                      labelText: context.tr.username,
                      filled: false,
                      hintText: context.tr.username),
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
                    GestureDetector(
                      onTap: () {
                        if (user == null) return;

                        context.push("/new_phone",
                            extra: user.phone.replaceAll("+966", ""));
                      },
                      child: ProfileOption(
                        title: context.tr.phone,
                        trailing: Text(
                          user?.phone ?? "",
                          style: const TextStyle(fontSize: AppTextSize.two),
                        ),
                      ),
                    ),
                    const Divider(
                      color: AppColors.neutral300,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (user == null) return;

                        context.push("/new_email", extra: user.email);
                      },
                      child: ProfileOption(
                        title: context.tr.email,
                      ),
                    ),
                    const Divider(
                      color: AppColors.neutral300,
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          SvgPicture.asset(
                                              "assets/img/auth/delete_acc.svg"),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            context.tr.deleteAccountQuestion,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          Text(
                                            context.tr.deleteAccountWarning,
                                            style: const TextStyle(
                                                fontSize: AppTextSize.one,
                                                color: AppColors.neutralRefix),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          PrimaryButton(
                                              text: context.tr.backButton,
                                              onPressed: () => context.pop()),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          ErrorButton(
                                              text: context.tr.delete_account,
                                              onPressed: () => ref.read(
                                                  deleteCurrentUserProvider))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: ProfileOption(
                        title: context.tr.delete_account,
                        trailing: const SizedBox.shrink(),
                        titleColor: AppColors.errorRefix,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
