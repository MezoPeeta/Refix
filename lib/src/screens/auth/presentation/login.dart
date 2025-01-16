import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:refix/src/core/localization/domain.dart';
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
  final _formKey = GlobalKey<FormState>();

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
                  context.tr.sign_in_hello,
                  style: const TextStyle(
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
                        return context.tr.enter_email;
                      }
                      return null;
                    },
                    decoration: InputDecoration(label: Text(context.tr.email))),
                const SizedBox(
                  height: AppSpacing.x,
                ),
                PasswordFormField(
                  passwordText: context.tr.password,
                  passwordController: passwordController,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(),
                    GestureDetector(
                      onTap: () => context.push("/forget_password"),
                      child: Text(context.tr.forgot_pass,
                          style: const TextStyle(fontSize: AppTextSize.two)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Consumer(builder: (context, ref, child) {
                  return PrimaryButton(
                      text: context.tr.sign_in,
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
            Text(
              context.tr.have_account,
              style: const TextStyle(fontSize: AppTextSize.three),
            ),
            const SizedBox(
              width: 4,
            ),
            GestureDetector(
              onTap: () => context.push("/sign_up"),
              child: Text(
                context.tr.register_now,
                style: const TextStyle(
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
      this.validator,
      required this.passwordController});
  final String passwordText;
  final String? Function(String?)? validator;
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
        validator: widget.validator ??
            (password) {
              if (password!.isEmpty) {
                return context.tr.enter_password;
              }
              if (password.length <= 8) {
                return context.tr.password_8;
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
