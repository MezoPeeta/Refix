import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:refix/src/screens/booking/data/booking_data.dart';

import '../../../core/ui/theme/colors.dart';
import '../../../core/ui/theme/radii.dart';

class IconContainer extends StatelessWidget {
  const IconContainer(
      {super.key,
      required this.name,
      required this.svgPath,
      required this.type});

  final String name;
  final String svgPath;
  final MainService type;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => context.pushNamed("Services",
            extra: name, pathParameters: {"type": type.name}),
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
    required this.type,
  });
  final String name;
  final String svgPath;
  final MainService type;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed("Services",
          extra: name, pathParameters: {"type": type.name}),
      child: Container(
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
      ),
    );
  }
}
