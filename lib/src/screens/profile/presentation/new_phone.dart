import 'package:flutter/material.dart';
import 'package:refix/src/core/localization/domain.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/core/ui/widgets/button.dart';

import '../../../core/ui/theme/colors.dart';

class NewPhone extends StatelessWidget {
  const NewPhone({super.key});

  static final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomScrollView(
            slivers: [
              SliverAppBar.large(
                  centerTitle: false,
                  title: Text(
                    context.tr.enterNewPhone,
                    style: const TextStyle(
                        fontSize: AppTextSize.six, fontWeight: FontWeight.w700),
                  )),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    TextFormField(
                      controller: phoneController,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return context.tr.enter_phone;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          icon: const Text("+966"),
                          fillColor: AppColors.neutral50,
                          filled: true,
                          hintText: context.tr.phone),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    PrimaryButton(text: context.tr.next, onPressed: () {})
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
