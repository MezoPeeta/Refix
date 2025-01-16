import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:refix/src/core/localization/domain.dart';
import 'package:refix/src/core/ui/widgets/button.dart';
import 'package:refix/src/screens/auth/domain/auth_domain.dart';

import '../../../core/ui/theme/colors.dart';
import '../../../core/ui/theme/radii.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});
  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

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
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.tr.forgot_pass,
                style: const TextStyle(
                    fontSize: AppTextSize.six, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                context.tr.dont_worry_title,
                style: const TextStyle(fontSize: AppTextSize.two),
              ),
              const SizedBox(
                height: 32,
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
                height: 32,
              ),
              Consumer(builder: (context, ref, child) {
                return PrimaryButton(
                    text: context.tr.send_code,
                    loading: loading,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          loading = true;
                        });
                        final result = await ref.read(
                            forgetPasswordProvider(email: emailController.text)
                                .future);
                        if (!context.mounted) return;
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
