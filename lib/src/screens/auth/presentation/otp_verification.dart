import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:refix/src/core/localization/domain.dart';
import 'package:refix/src/core/ui/widgets/button.dart';
import 'package:refix/src/screens/auth/domain/auth_domain.dart';

import '../../../core/ui/theme/colors.dart';
import '../../../core/ui/theme/radii.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key, required this.email});

  final String email;

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  final controller = TextEditingController();
  bool loading = false;
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.tr.otp_verification,
                style: const TextStyle(
                    fontSize: AppTextSize.six, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                context.tr.otp_verification_message,
                style: const TextStyle(fontSize: AppTextSize.two),
              ),
              const SizedBox(
                height: 32,
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Pinput(
                  length: 4,
                  controller: controller,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "please fill otp";
                    }
                    return null;
                  },
                  defaultPinTheme: PinTheme(
                      width: MediaQuery.sizeOf(context).width,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.neutral50)),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Consumer(builder: (context, ref, child) {
                return PrimaryButton(
                    text: context.tr.confirm,
                    loading: loading,
                    onPressed: () async {
                      if (_key.currentState!.validate()) {
                        setState(() {
                          loading = true;
                        });
                        final result = await ref.read(
                            verifyOTPProvider(otp: controller.text).future);
                        setState(() {
                          loading = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(result
                                ? context.tr.otpVerified
                                : context.tr.otpLimit)));
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
