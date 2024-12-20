import 'package:flutter/material.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/core/ui/widgets/button.dart';


class NewEmail extends StatelessWidget {
  const NewEmail({super.key, required this.email});

  final String email;
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController(text: email);
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
                      controller: emailController,
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
