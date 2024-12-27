import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:refix/src/core/ui/widgets/button.dart';
import 'package:refix/src/core/ui/widgets/header.dart';

class NetworkError extends StatelessWidget {
  const NetworkError({super.key, required this.onTryAgain});
  final VoidCallback onTryAgain;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              SvgPicture.asset("assets/img/network_error.svg"),
              const TextHeader(text: "Network Failed"),
              PrimaryButton(text: "Try Again", onPressed: onTryAgain)
            ],
          ),
        ),
      ),
    );
  }
}
