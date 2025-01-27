import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:refix/src/core/localization/domain.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/core/ui/widgets/button.dart';

import '../../../core/ui/theme/colors.dart';
import '../../auth/domain/auth_domain.dart';
import '../domain/user_notifier.dart';

class NewPhone extends StatefulWidget {
  const NewPhone({super.key, required this.phone});

  final String? phone;
  static final _formKey = GlobalKey<FormState>();

  @override
  State<NewPhone> createState() => _NewPhoneState();
}

class _NewPhoneState extends State<NewPhone> {
  @override
  Widget build(BuildContext context) {
    final phoneController = TextEditingController(text: widget.phone);
    bool loading = false;

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
                  key: NewPhone._formKey,
                  child: Column(
                    children: [
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: TextFormField(
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
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Consumer(builder: (context, ref, child) {
                        return PrimaryButton(
                            text: context.tr.next,
                            loading: loading,
                            onPressed: () async {
                              if (NewPhone._formKey.currentState!.validate()) {
                                setState(() {
                                  loading = true;
                                });
                                if (loading == true) {
                                  final currentUser = await ref
                                      .read(customerNotifierProvider.future);
                                  if (currentUser!.phone
                                      .contains(phoneController.text)) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content:
                                                Text(context.tr.changePhone)));
                                    return;
                                  }
                                  await ref
                                      .read(customerNotifierProvider.notifier)
                                      .updateCustomer(currentUser.copyWith(
                                          phone:
                                              "+966${phoneController.text}"));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text("Updated")));
                                }
                                setState(() {
                                  loading = false;
                                });
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
