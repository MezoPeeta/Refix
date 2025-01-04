import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:refix/src/core/localization/domain.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/core/ui/widgets/button.dart';

import '../../../core/ui/theme/colors.dart';

class SwitchPhone extends StatelessWidget {
  const SwitchPhone({super.key, required this.phone});
  final String? phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr.switchToNewNumber),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              context.tr.currentlyRegisteredNumber(phone ?? ""),
              style: const TextStyle(
                  color: AppColors.neutralRefix, fontSize: AppTextSize.one),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: PrimaryButton(
            text: context.tr.switchNow,
            onPressed: () => context.push("/new_phone",
                extra: phone?.replaceAll("+966", ""))),
      ),
    );
  }
}
