import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:refix/src/core/localization/domain.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/core/ui/widgets/button.dart';

import '../../../core/ui/theme/colors.dart';
import '../../auth/domain/auth_domain.dart';

class NewPhone extends StatelessWidget {
  const NewPhone({super.key, required this.phone});

  final String? phone;
  static final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final phoneController = TextEditingController(text: phone);

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
                child: Form(
                  key: _formKey,
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
                      Consumer(builder: (context, ref, child) {
                        return PrimaryButton(
                            text: context.tr.next,
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                final currentUser = await ref
                                    .read(getCurrentUserProvider.future);
                                if (currentUser!.phone
                                    .contains(phoneController.text)) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text(context.tr.changePhone)));
                                  return;
                                }
                                ref.read(updateCurrentUserProvider(
                                    user: currentUser.copyWith(
                                        email: "+966${phoneController.text}")));
                              }
                            });
                      })
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
