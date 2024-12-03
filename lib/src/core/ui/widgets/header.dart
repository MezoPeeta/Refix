import 'package:flutter/material.dart';
import 'package:refix/src/core/ui/theme/radii.dart';

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
