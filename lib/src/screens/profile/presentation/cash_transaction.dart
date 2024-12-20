import 'package:flutter/material.dart';
import 'package:refix/src/core/ui/theme/radii.dart';

import '../../../core/ui/theme/colors.dart';

class CashTransaction extends StatelessWidget {
  const CashTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cash payment transactions"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "The required amount will appear on your phone and the driver's phone at the end of the ride. Make sure to have some extra cash with you.",
              style: TextStyle(
                  color: AppColors.neutralRefix, fontSize: AppTextSize.one),
            )
          ],
        ),
      ),
    );
  }
}
