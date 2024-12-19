import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Profile"),
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
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          filled: false, hintText: "First Name"),
                    ),
                    const Divider(),
                    TextFormField(
                      decoration: const InputDecoration(
                          filled: false, hintText: "Last Name"),
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
                    ProfileOption(
                      title: "Phone Number",
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
                      child: const ProfileOption(
                        title: "Email",
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
                                              text: "Delete Account",
                                              onPressed: () {})
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: const ProfileOption(
                        title: "Delete Account",
                        trailing: SizedBox.shrink(),
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
