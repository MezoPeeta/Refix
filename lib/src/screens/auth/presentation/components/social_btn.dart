import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/ui/theme/colors.dart';

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
