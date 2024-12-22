import 'package:flutter/material.dart';
import 'package:refix/src/core/localization/domain.dart';

class AboutRefix extends StatelessWidget {
  const AboutRefix({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr.about_refix),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset("assets/img/home/logo.png"),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text("Refix 1.0.0")
        ],
      ),
    );
  }
}
