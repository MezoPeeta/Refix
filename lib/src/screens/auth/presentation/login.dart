import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:refix/src/core/ui/theme/colors.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/core/ui/widgets/button.dart';
import 'package:refix/src/screens/auth/domain/auth_domain.dart';
import 'package:refix/src/screens/auth/presentation/components/divider_text.dart';

import 'components/social_btn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  static final passwordController = TextEditingController();
  static final emailController = TextEditingController();
  static final _formKey = GlobalKey<FormState>();

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
                const Text(
                  "Welcome back! Happy to see you, Again!",
                  style: TextStyle(
                      fontSize: AppTextSize.six, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                    controller: emailController,
                    autofillHints: const [AutofillHints.email],
                    validator: (email) {
                      if (email!.isEmpty) {
                        return "Please enter your email";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(label: Text("Email"))),
                const SizedBox(
                  height: AppSpacing.x,
                ),
                PasswordFormField(
                  passwordController: passwordController,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(),
                    Text("Forgot Password?",
                        style: TextStyle(fontSize: AppTextSize.two))
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Consumer(builder: (context, ref, child) {
                  return PrimaryButton(
                      text: "Login",
                      loading: loading,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          final user = await ref.read(authProvider).signin(
                              email: emailController.text,
                              password: passwordController.text);
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
  const PasswordFormField(
      {super.key,
      this.passwordText = "Password",
      this.passwordControllerText,
      required this.passwordController});
  final String passwordText;
  final String? passwordControllerText;
  final TextEditingController passwordController;

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.passwordController,
        obscureText: !isVisible,
        validator: (password) {
          if (password!.isEmpty) {
            return "Please enter your password";
          }
          if (password.length <= 8 && widget.passwordControllerText == null) {
            return "Password must be atleast 8 letters";
          }
          if (widget.passwordControllerText != null) {
            print(widget.passwordControllerText);

            if (widget.passwordControllerText !=
                widget.passwordController.text) {
              return "Confirm password must be exactly your password";
            }
          }
          return null;
        },
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
