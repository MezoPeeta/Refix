import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/core/ui/widgets/button.dart';

import '../../../core/ui/theme/colors.dart';

class NewPhone extends StatelessWidget {
  const NewPhone({super.key});

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
                    "Enter New Number",
                    style: TextStyle(
                        fontSize: AppTextSize.six, fontWeight: FontWeight.w700),
                  )),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    InternationalPhoneNumberInput(
                        selectorConfig: const SelectorConfig(
                            showFlags: false,
                            setSelectorButtonAsPrefixIcon: true),
                        inputDecoration: InputDecoration(
                            fillColor: AppColors.neutral50,
                            filled: true,
                            contentPadding: const EdgeInsets.all(AppSpacing.x),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.circular(AppRadii.lg)),
                            hintStyle: const TextStyle(
                                color: AppColors.neutralRefix,
                                fontSize: AppTextSize.two)),
                        onInputChanged: (value) {}),
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
