import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:refix/src/core/localization/domain.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/core/ui/widgets/button.dart';
import 'package:refix/src/screens/profile/presentation/profile.dart';

import '../../../core/ui/theme/colors.dart';
import '../../auth/domain/auth_domain.dart';

class UserProfile extends ConsumerWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(getCurrentUserProvider).value;
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
                    ProfileOption(
                      title: context.tr.phone,
                      trailing: Text(
                        user?.phone ?? "",
                        style: const TextStyle(fontSize: AppTextSize.two),
                      ),
                    ),
                    const Divider(
                      color: AppColors.neutral300,
                    ),
                    GestureDetector(
                      onTap: () =>
                          context.push("/new_email", extra: user?.email),
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
                                          const Text(
                                            "Do you want to delete the account?",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          const Text(
                                            "Your account will be deleted within 4 days from now",
                                            style: TextStyle(
                                                fontSize: AppTextSize.one,
                                                color: AppColors.neutralRefix),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          PrimaryButton(
                                              text: "Back",
                                              onPressed: () => context.pop()),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          ErrorButton(
                                              text: context.tr.delete_account,
                                              onPressed: () {})
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
