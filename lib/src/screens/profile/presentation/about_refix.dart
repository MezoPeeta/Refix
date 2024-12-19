import 'package:flutter/material.dart';

class AboutRefix extends StatelessWidget {
  const AboutRefix({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Refix"),
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
