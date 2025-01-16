import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:refix/src/core/localization/domain.dart';
import 'package:refix/src/core/ui/theme/colors.dart';
import 'package:refix/src/core/ui/widgets/button.dart';

import '../../../core/ui/theme/radii.dart';

class BookingSuccess extends StatelessWidget {
  const BookingSuccess({super.key});

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
              SvgPicture.asset("assets/img/check.svg"),
              Text(
                context.tr.booking_done_title,
                style: const TextStyle(
                    fontSize: AppTextSize.six, fontWeight: FontWeight.w700),
              ),
              Text(
                context.tr.reservation_added_message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: AppTextSize.two,
                    color: AppColors.neutralRefix,
                    fontWeight: FontWeight.w300),
              ),
              SecondaryButton(
                  text: context.tr.back_to_home,
                  onPressed: () => context.go("/"))
            ],
          ),
        ),
      ),
    );
  }
}
