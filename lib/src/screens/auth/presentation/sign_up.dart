import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:refix/src/core/localization/domain.dart';
import 'package:refix/src/core/ui/widgets/button.dart';
import 'package:refix/src/screens/auth/presentation/login.dart';

import '../../../core/ui/theme/colors.dart';
import '../../../core/ui/theme/radii.dart';
import '../domain/auth_domain.dart';
import 'components/divider_text.dart';
import 'components/social_btn.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String? phoneNumber;
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  context.tr.signup_welcome,
                  style: const TextStyle(
                      fontSize: AppTextSize.six, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                    controller: usernameController,
                    validator: (username) {
                      if (username!.isEmpty) {
                        return context.tr.enter_username;
                      }
                      return null;
                    },
                    decoration:
                        InputDecoration(label: Text(context.tr.username))),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                    controller: emailController,
                    validator: (email) {
                      if (email!.isEmpty) {
                        return context.tr.enter_email;
                      }
                      return null;
                    },
                    decoration: InputDecoration(label: Text(context.tr.email))),
                const SizedBox(
                  height: 16,
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: TextFormField(
                    controller: phoneController,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return context.tr.enter_phone;
                      }
                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                    ],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        icon: const Text("+966"),
                        fillColor: AppColors.neutral50,
                        filled: true,
                        hintText: context.tr.phone),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                PasswordFormField(
                  passwordText: context.tr.password,
                  passwordController: passwordController,
                ),
                const SizedBox(
                  height: 16,
                ),
                PasswordFormField(
                  passwordController: confirmPasswordController,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return context.tr.renter;
                    }
                    if (v != passwordController.text) {
                      return context.tr.password_8;
                    }
                    return null;
                  },
                  passwordText: context.tr.confirm_password,
                ),
                const SizedBox(
                  height: 32,
                ),
                Consumer(builder: (context, ref, child) {
                  return PrimaryButton(
                      loading: loading,
                      text: context.tr.sign_up,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          final user = await ref.read(authProvider).signup(
                              email: emailController.text,
                              phone: "+966${phoneController.text}",
                              username: usernameController.text,
                              password: confirmPasswordController.text);

                          user.fold((value) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text(value)));
                            setState(() {
                              loading = false;
                            });
                          }, (value) {
                            setState(() {
                              loading = false;
                            });
                            context.go("/");
                          });
                        }
                      });
                }),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        context.tr.not_account,
                        style: const TextStyle(fontSize: AppTextSize.three),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: () => context.push("/login"),
                        child: Text(
                          context.tr.sign_in,
                          style: const TextStyle(
                              color: AppColors.primaryRefix,
                              fontWeight: FontWeight.w700,
                              fontSize: AppTextSize.three),
                        ),
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
