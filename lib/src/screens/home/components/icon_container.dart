import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/ui/theme/colors.dart';
import '../../../core/ui/theme/radii.dart';

class IconContainer extends StatelessWidget {
  const IconContainer({
    super.key,
    required this.name,
    required this.svgPath,
  });

  final String name;
  final String svgPath;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => context.push("/services", extra: name),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.x,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadii.lg),
                  color: AppColors.neutral100),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(svgPath),
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            SizedBox(
              height: 50,
              child: Text(
                name,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ElevatorIconContainer extends StatelessWidget {
  const ElevatorIconContainer({
    super.key,
    required this.name,
    required this.svgPath,
  });
  final String name;
  final String svgPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.fromLTRB(
          AppSpacing.x, AppSpacing.lg, AppSpacing.x, AppSpacing.lg),
      decoration: BoxDecoration(
          color: AppColors.neutral100,
          borderRadius: BorderRadius.circular(AppRadii.lg)),
      child: Row(
        children: [
          Expanded(child: Text(name)),
          SvgPicture.asset(
            svgPath,
            width: 50,
            height: 50,
          )
        ],
      ),
    );
  }
}
