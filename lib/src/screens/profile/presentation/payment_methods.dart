import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:refix/src/core/localization/domain.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/core/ui/widgets/button.dart';

import '../../../core/ui/theme/colors.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr.payment_methods),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppRadii.lg)),
              child: CheckboxListTile.adaptive(
                value: false,
                contentPadding: EdgeInsets.zero,
                onChanged: (v) {},
                title: Row(
                  spacing: 8,
                  children: [
                    SvgPicture.asset(
                      "assets/img/profile/cash.svg",
                    ),
                    Text(
                      context.tr.cash,
                      style: const TextStyle(fontSize: AppTextSize.three),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppRadii.lg)),
              child: Column(
                children: [
                  CheckboxListTile.adaptive(
                    value: false,
                    contentPadding: EdgeInsets.zero,
                    onChanged: (v) {},
                    title: Row(
                      spacing: 8,
                      children: [
                        SvgPicture.asset(
                          "assets/img/profile/visa.svg",
                        ),
                        Text(
                          context.tr.visa,
                          style: const TextStyle(fontSize: AppTextSize.three),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: AppColors.neutral300,
                  ),
                  CheckboxListTile.adaptive(
                    value: true,
                    contentPadding: EdgeInsets.zero,
                    onChanged: (v) {},
                    title: Row(
                      spacing: 8,
                      children: [
                        SvgPicture.asset(
                          "assets/img/profile/mastercard.svg",
                        ),
                        Text(
                          context.tr.visa,
                          style: const TextStyle(fontSize: AppTextSize.three),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: AppColors.neutral300,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const CircleAvatar(
                      backgroundColor: AppColors.primary50,
                      child: Icon(
                        Icons.add,
                        color: AppColors.primaryRefix,
                      ),
                    ),
                    title: Text(
                      context.tr.addCard,
                      style: const TextStyle(fontSize: AppTextSize.three),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            PrimaryButton(
                text: context.tr.continuee,
                onPressed: () => context.go("/bookingfinalDone"))
          ],
        ),
      ),
    );
  }
}
