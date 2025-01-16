import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:refix/src/core/localization/domain.dart';
import 'package:refix/src/core/ui/theme/colors.dart';
import 'package:refix/src/core/ui/widgets/button.dart';

import '../../../core/ui/theme/radii.dart';

class RedeemPoints extends StatelessWidget {
  const RedeemPoints({super.key, required this.percentage});
  final String percentage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              SvgPicture.asset("assets/img/check.svg"),
              Text(
                context.tr.points_redeemed_message(percentage),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: AppTextSize.six, fontWeight: FontWeight.w700),
              ),
              PrimaryButton(
                  text: context.tr.back_to_home,
                  onPressed: () => context.go("/")),
            ],
          ),
        ),
      ),
    );
  }
}
