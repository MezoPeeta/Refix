import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
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
                InternationalPhoneNumberInput(
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return context.tr.enter_phone;
                      }
                      return null;
                    },
                    initialValue: PhoneNumber(isoCode: "SA"),
                    selectorConfig: SelectorConfig(
                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                        leadingPadding: 16,
                        showFlags: false,
                        useEmoji: true,
                        countryComparator: (country1, country2) {
                          return country1.name!.compareTo(country2.name!);
                        },
                        setSelectorButtonAsPrefixIcon: true),
                    inputDecoration: InputDecoration(
                        fillColor: AppColors.neutral50,
                        filled: true,
                        contentPadding: const EdgeInsets.all(AppSpacing.x),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(AppRadii.lg)),
                        hintStyle: const TextStyle(
                            color: AppColors.neutralRefix,
                            fontSize: AppTextSize.two)),
                    onInputChanged: (value) {
                      setState(() {
                        phoneNumber = value.phoneNumber;
                      });
                    }),
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
                        print(phoneNumber);
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          final user = await ref.read(authProvider).signup(
                              email: emailController.text,
                              phone: phoneNumber!,
                              username: usernameController.text,
                              password: confirmPasswordController.text);

                          user.fold((value) {
                            print(value);
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text(value)));
                            setState(() {
                              loading = false;
                            });
                          }, (value) {
                            print(value);
                            setState(() {
                              loading = false;
                            });
                            context.go("/");
                          });
                        }
                      });
                }),
                const SizedBox(
                  height: 32,
                ),
                DividerWithText(
                  name: context.tr.sign_up,
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    SocialButton(
                      svgPath: "assets/img/auth/facebook.svg",
                      onTap: () {},
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    SocialButton(
                      svgPath: "assets/img/auth/google.svg",
                      onTap: () {},
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    SocialButton(
                      svgPath: "assets/img/auth/apple.svg",
                      onTap: () {},
                    ),
                  ],
                ),
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
