import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:refix/src/core/ui/theme/radii.dart';

import '../../../core/ui/theme/colors.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Methods"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppRadii.lg)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "3.55",
                        style: TextStyle(
                            fontSize: AppTextSize.eight,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Points Balance",
                        style: TextStyle(
                            fontSize: AppTextSize.three,
                            color: AppColors.neutralRefix,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: AppColors.neutral100,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: const Text(
                      "Switch Points",
                      style: TextStyle(fontSize: AppTextSize.three),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppRadii.lg)),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: SvgPicture.asset(
                  "assets/img/profile/cash.svg",
                ),
                title: Text(
                  "Cash",
                  style: TextStyle(fontSize: AppTextSize.three),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppRadii.lg)),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: SvgPicture.asset(
                      "assets/img/profile/visa.svg",
                    ),
                    title: Text(
                      "Visa (9904)",
                      style: TextStyle(fontSize: AppTextSize.three),
                    ),
                  ),
                  Divider(
                    color: AppColors.neutral300,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: SvgPicture.asset(
                      "assets/img/profile/mastercard.svg",
                    ),
                    title: Text(
                      "Visa (9904)",
                      style: TextStyle(fontSize: AppTextSize.three),
                    ),
                  ),
                  Divider(
                    color: AppColors.neutral300,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      child: Icon(
                        Icons.add,
                        color: AppColors.primaryRefix,
                      ),
                      backgroundColor: AppColors.primary50,
                    ),
                    title: Text(
                      "Add a credit/debit card",
                      style: TextStyle(fontSize: AppTextSize.three),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
