import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:worker/src/core/localization/domain.dart';

import '../../../core/theme/colors.dart';
import '../../../core/theme/radii.dart';
import '../../../core/widgets/btns.dart';
import '../domain/auth_domain.dart';

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
                            context.go("/");

                            setState(() {
                              loading = false;
                            });
                          });
                        }
                      });
                }),
              ],
            ),
          ),
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
