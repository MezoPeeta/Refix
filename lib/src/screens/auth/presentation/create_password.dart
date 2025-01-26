import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:refix/src/core/localization/domain.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/screens/auth/domain/auth_domain.dart';
import 'package:refix/src/screens/auth/presentation/login.dart';

import '../../../core/ui/theme/colors.dart';
import '../../../core/ui/widgets/button.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key, required this.otp});

  final String otp;

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  bool loading = false;
  final passController = TextEditingController();
  final confirmController = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _key,
          child: Column(
            children: [
              Text(
                context.tr.createNewPassword,
                style: const TextStyle(
                    fontSize: AppTextSize.six, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                context.tr.passwordUniqueness,
                style: const TextStyle(fontSize: AppTextSize.two),
              ),
              const SizedBox(
                height: 32,
              ),
              PasswordFormField(
                passwordController: passController,
                passwordText: context.tr.password,
              ),
              const SizedBox(
                height: 16,
              ),
              PasswordFormField(
                passwordController: confirmController,
                passwordText: context.tr.confirm_password,
                validator: (v) {
                  if (v != passController.text) {
                    return context.tr.confirm_valid;
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 32,
              ),
              Consumer(builder: (context, ref, child) {
                return PrimaryButton(
                    text: context.tr.resetPassword,
                    loading: loading,
                    onPressed: () async {
                      if (_key.currentState!.validate()) {
                        setState(() {
                          loading = true;
                        });
                        log("OTP: ${widget.otp}");
                        final result = await ref.read(resetPasswordProvider(
                                otp: widget.otp,
                                password: confirmController.text)
                            .future);
                        setState(() {
                          loading = false;
                        });
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(result)));
                      }
                    });
              })
            ],
          ),
        ),
      ),
    );
  }
}
