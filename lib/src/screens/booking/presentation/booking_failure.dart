import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:refix/src/core/localization/domain.dart';
import 'package:refix/src/core/ui/theme/colors.dart';
import 'package:refix/src/core/ui/widgets/button.dart';
import 'package:refix/src/screens/profile/presentation/payment_methods.dart';

import '../../../core/ui/theme/radii.dart';

class BookingFailure extends StatelessWidget {
  const BookingFailure({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              SvgPicture.asset("assets/img/failure.svg"),
              Text(
                context.tr.error_with_pay_title,
                style: const TextStyle(
                    fontSize: AppTextSize.six, fontWeight: FontWeight.w700),
              ),
              Consumer(builder: (context, ref, child) {
                return PrimaryButton(
                    text: context.tr.try_another_card,
                    onPressed: () => context.go("/payment_method"));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
