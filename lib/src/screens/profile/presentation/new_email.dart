import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:refix/src/core/localization/domain.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/core/ui/widgets/button.dart';
import 'package:refix/src/screens/auth/domain/auth_domain.dart';
import 'package:refix/src/screens/profile/domain/user_notifier.dart';

class NewEmail extends StatefulWidget {
  const NewEmail({super.key, required this.email});

  final String email;
  static final _formKey = GlobalKey<FormState>();

  @override
  State<NewEmail> createState() => _NewEmailState();
}

class _NewEmailState extends State<NewEmail> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController(text: widget.email);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomScrollView(
            slivers: [
              SliverAppBar.large(
                  centerTitle: false,
                  title: Text(
                    context.tr.enterNewEmail,
                    style: const TextStyle(
                        fontSize: AppTextSize.six, fontWeight: FontWeight.w700),
                  )),
              SliverToBoxAdapter(
                child: Form(
                  key: NewEmail._formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: emailController,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return context.tr.enter_email;
                          }
                          return null;
                        },
                        decoration:
                            InputDecoration(labelText: context.tr.email),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Consumer(
                          builder: (context, ref, child) => PrimaryButton(
                              text: context.tr.next,
                              loading: loading,
                              onPressed: () async {
                                if (NewEmail._formKey.currentState!
                                    .validate()) {
                                  setState(() {
                                    loading = true;
                                  });
                                  if (loading == true) {
                                    final currentUser = await ref
                                        .read(customerNotifierProvider.future);
                                    if (currentUser!.email ==
                                        emailController.text) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  context.tr.changeEmail)));
                                      return;
                                    }
                                    await ref
                                        .read(customerNotifierProvider.notifier)
                                        .updateCustomer(currentUser.copyWith(
                                            email: emailController.text));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text("Updated")));
                                  }
                                  setState(() {
                                    loading = false;
                                  });
                                }
                              }))
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
