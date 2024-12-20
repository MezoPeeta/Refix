import 'package:flutter/material.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/core/ui/widgets/button.dart';

class CancelReasonScreen extends StatelessWidget {
  const CancelReasonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: const CustomScrollView(
          slivers: [
            SliverAppBar.medium(
              title: Text(
                "Please let us know the reason for cancellation.",
                style: TextStyle(
                    fontSize: AppTextSize.three, fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16),
          child: ErrorButton(text: "Cancel Booking", onPressed: () {}),
        ));
  }
}
