import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/core/ui/widgets/button.dart';

import '../../../core/ui/theme/colors.dart';

class NewEmail extends StatelessWidget {
  const NewEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomScrollView(
            slivers: [
              const SliverAppBar.large(
                  centerTitle: false,
                  title: Text(
                    "Enter New Email",
                    style: TextStyle(
                        fontSize: AppTextSize.six, fontWeight: FontWeight.w700),
                  )),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(hintText: "Email"),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    PrimaryButton(text: "Next", onPressed: () {})
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
