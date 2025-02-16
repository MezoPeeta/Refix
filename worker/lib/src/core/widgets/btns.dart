import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../screens/tasks/in_task.dart';
import '../theme/colors.dart';
import '../theme/radii.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.svgPath,
    required this.onTap,
  });

  final String svgPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 56,
          decoration: BoxDecoration(
              color: AppColors.neutral50,
              borderRadius: BorderRadius.circular(8)),
          child: SvgPicture.asset(
            svgPath,
            width: 12,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}

class DividerWithText extends StatelessWidget {
  const DividerWithText({
    super.key,
    required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      const Expanded(
          child: Divider(
        thickness: 2,
      )),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.x),
        child: Text(name),
      ),
      const Expanded(
          child: Divider(
        thickness: 2,
      )),
    ]);
  }
}

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

class TextHeader extends StatelessWidget {
  const TextHeader(
      {super.key, required this.text, this.fontWeight = FontWeight.w500});

  final String text;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: AppTextSize.three.toDouble(), fontWeight: fontWeight),
    );
  }
}

class AddedImage extends StatelessWidget {
  const AddedImage({
    super.key,
    required this.path,
    this.isFile = true,
  });

  final String path;
  final bool isFile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) =>
                FullScreenImage(imageUrl: "https://api.refixapp.com/$path"),
          ),
        );
      },
      child: Container(
        width: 77,
        height: 80,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: isFile
                    ? FileImage(File(path))
                    : NetworkImage("https://api.refixapp.com/$path")),
            borderRadius: BorderRadius.circular(AppRadii.lg)),
      ),
    );
  }
}
