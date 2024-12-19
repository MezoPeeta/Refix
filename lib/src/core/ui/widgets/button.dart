import 'package:flutter/material.dart';
import 'package:refix/src/core/ui/theme/colors.dart';
import 'package:refix/src/core/ui/theme/radii.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.loading = false,
  });

  final String text;
  final bool loading;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: 52,
      child: ElevatedButton(
          onPressed: onPressed,
          child: loading
              ? const CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                )
              : Text(text)),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.size,
  });

  final String text;

  final VoidCallback onPressed;

  final Size? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size?.width ?? MediaQuery.sizeOf(context).width,
      height: size?.height ?? 52,
      child: ElevatedButton(
          style: const ButtonStyle(
              foregroundColor: WidgetStatePropertyAll(AppColors.secondaryRefix),
              backgroundColor: WidgetStatePropertyAll(AppColors.secondary100)),
          onPressed: onPressed,
          child: FittedBox(child: Text(text))),
    );
  }
}

class ErrorButton extends StatelessWidget {
  const ErrorButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.size,
  });

  final String text;

  final VoidCallback onPressed;

  final Size? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size?.width ?? MediaQuery.sizeOf(context).width,
      height: size?.height ?? 52,
      child: ElevatedButton(
          style: const ButtonStyle(
              foregroundColor: WidgetStatePropertyAll(AppColors.errorRefix),
              backgroundColor: WidgetStatePropertyAll(AppColors.neutral50)),
          onPressed: onPressed,
          child: Text(text,
              style: const TextStyle(
                fontSize: AppTextSize.three,
              ))),
    );
  }
}
