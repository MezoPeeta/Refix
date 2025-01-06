import 'package:dashboard/src/core/theme/colors.dart';
import 'package:dashboard/src/core/theme/radii.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.loading,
  });

  final String text;

  final VoidCallback onPressed;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: 52,
      child: ElevatedButton(
          onPressed: onPressed,
          child: loading
              ? const CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation(Colors.white))
              : Text(text)),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.loading = false,
    this.size,
  });

  final String text;

  final VoidCallback onPressed;

  final Size? size;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size?.width ?? MediaQuery.sizeOf(context).width,
      height: size?.height ?? 52,
      child: ElevatedButton(
          style: const ButtonStyle(
              foregroundColor: WidgetStatePropertyAll(AppColors.white),
              backgroundColor: WidgetStatePropertyAll(AppColors.primaryRefix)),
          onPressed: onPressed,
          child: loading
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                )
              : FittedBox(child: Text(text))),
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
