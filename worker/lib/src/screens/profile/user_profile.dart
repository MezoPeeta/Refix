import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:worker/src/core/localization/domain.dart';
import 'package:worker/src/core/widgets/btns.dart';
import 'package:worker/src/screens/auth/domain/auth_domain.dart';
import 'package:worker/src/screens/auth/signin/signin.dart';

import '../../core/theme/radii.dart';
import 'profile.dart';

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
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.white,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            spacing: 16,
                            children: [
                              PasswordFormField(
                                  passwordController: TextEditingController()),
                              PasswordFormField(
                                  passwordController: TextEditingController()),
                              PasswordFormField(
                                  passwordController: TextEditingController()),
                              Column(
                                spacing: 16,
                                children: [
                                  PrimaryButton(
                                      text: "Change Password",
                                      onPressed: () {}),
                                  TextButton(
                                      onPressed: () {}, child: Text("Back"))
                                ],
                              ),
                            ],
                          ),
                        );
                      });
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(AppRadii.lg)),
                  child: ProfileOption(title: "Change password"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
