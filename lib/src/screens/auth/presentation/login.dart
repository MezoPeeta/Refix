import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:refix/src/core/ui/theme/colors.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/core/ui/widgets/button.dart';
import 'package:refix/src/screens/auth/presentation/components/divider_text.dart';

import 'components/social_btn.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                "Welcome back! Happy to see you, Again!",
                style: TextStyle(
                    fontSize: AppTextSize.six, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                  decoration:
                      const InputDecoration(label: Text("Phone Number"))),
              const SizedBox(
                height: AppSpacing.x,
              ),
              const PasswordFormField(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                        shape: const CircleBorder(),
                      ),
                      const Text(
                        "Remember Me",
                        style: TextStyle(fontSize: AppTextSize.two),
                      )
                    ],
                  ),
                  const Text("Forgot Password?",
                      style: TextStyle(fontSize: AppTextSize.two))
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              PrimaryButton(
                  text: "Login",
                  onPressed: () {
                    context.go("/");
                  }),
              const SizedBox(
                height: 64,
              ),
              const DividerWithText(
                name: "Or Login with",
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
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don’t have an account?",
              style: TextStyle(fontSize: AppTextSize.three),
            ),
            const SizedBox(
              width: 4,
            ),
            GestureDetector(
              onTap: () => context.push("/sign_up"),
              child: const Text(
                "Register Now",
                style: TextStyle(
                    color: AppColors.primaryRefix,
                    fontWeight: FontWeight.w700,
                    fontSize: AppTextSize.three),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    super.key,
    this.passwordText = "Password",
  });
  final String passwordText;

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: !isVisible,
        decoration: InputDecoration(
            label: Text(widget.passwordText),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              child: Icon(
                isVisible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: AppColors.neutralRefix,
              ),
            )));
  }
}
