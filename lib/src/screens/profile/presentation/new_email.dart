import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:refix/src/core/localization/domain.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/core/ui/widgets/button.dart';
import 'package:refix/src/screens/auth/domain/auth_domain.dart';

class NewEmail extends StatelessWidget {
  const NewEmail({super.key, required this.email});

  final String email;
  static final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController(text: email);
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
                  key: _formKey,
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
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  final currentUser = await ref
                                      .read(getCurrentUserProvider.future);
                                  if (currentUser!.email ==
                                      emailController.text) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content:
                                                Text(context.tr.changeEmail)));
                                    return;
                                  }
                                  ref.read(updateCurrentUserProvider(
                                      user: currentUser.copyWith(
                                          email: emailController.text)));
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
