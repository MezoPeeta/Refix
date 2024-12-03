import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:refix/src/core/navigation/routes.dart';
import 'package:refix/src/core/ui/widgets/button.dart';
import 'package:refix/src/screens/auth/presentation/login.dart';

import '../../../core/ui/theme/colors.dart';
import '../../../core/ui/theme/radii.dart';
import 'components/divider_text.dart';
import 'components/social_btn.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
          child: Column(
            children: [
              const Text(
                "Hello! Register to get started",
                style: TextStyle(
                    fontSize: AppTextSize.six, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                  decoration: const InputDecoration(label: Text("Username"))),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                  decoration: const InputDecoration(label: Text("Email"))),
              const SizedBox(
                height: 16,
              ),
              InternationalPhoneNumberInput(
                  selectorConfig: const SelectorConfig(
                      showFlags: false, setSelectorButtonAsPrefixIcon: true),
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
                  onInputChanged: (value) {}),
              const SizedBox(
                height: 16,
              ),
              const PasswordFormField(),
              const SizedBox(
                height: 16,
              ),
              const PasswordFormField(
                passwordText: "Confirm Password",
              ),
              const SizedBox(
                height: 32,
              ),
              PrimaryButton(text: "Sign Up", onPressed: () {}),
              const SizedBox(
                height: 32,
              ),
              const DividerWithText(
                name: "Or Register with",
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
                    const Text(
                      "Already Have An Account?",
                      style: TextStyle(fontSize: AppTextSize.three),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: () => context.push("/login"),
                      child: const Text(
                        "Login",
                        style: TextStyle(
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
    );
  }
}
