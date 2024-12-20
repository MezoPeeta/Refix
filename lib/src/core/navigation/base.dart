import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:refix/src/core/localization/domain.dart';
import 'package:refix/src/core/ui/theme/colors.dart';
import 'package:refix/src/screens/profile/presentation/profile.dart';
import 'package:refix/src/screens/home/home.dart';
import 'package:refix/src/screens/booking/presentation/booking.dart';
import 'package:refix/src/screens/points/presentation/points.dart';

class BaseWidget extends StatefulWidget {
  const BaseWidget({super.key});

  @override
  State<BaseWidget> createState() => _BaseWidgetState();
}

class _BaseWidgetState extends State<BaseWidget> {
  int currentIndex = 0;
  final List<Widget> children = <Widget>[
    const HomeScreen(),
    const BookingScreen(),
    const PointsScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: children[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              label: context.tr.home,
              icon: SvgPicture.asset(
                "assets/img/home.svg",
                colorFilter: ColorFilter.mode(
                    currentIndex == 0
                        ? AppColors.primaryRefix
                        : AppColors.neutral400,
                    BlendMode.srcIn),
              )),
          BottomNavigationBarItem(
              label: context.tr.booking,
              icon: SvgPicture.asset(
                "assets/img/booking.svg",
                colorFilter: ColorFilter.mode(
                    currentIndex == 1
                        ? AppColors.primaryRefix
                        : AppColors.neutral400,
                    BlendMode.srcIn),
              )),
          BottomNavigationBarItem(
              label: context.tr.points,
              icon: SvgPicture.asset(
                "assets/img/points.svg",
                colorFilter: ColorFilter.mode(
                    currentIndex == 2
                        ? AppColors.primaryRefix
                        : AppColors.neutral400,
                    BlendMode.srcIn),
              )),
          BottomNavigationBarItem(
              label: context.tr.your_profile,
              icon: SvgPicture.asset(
                "assets/img/profile.svg",
                colorFilter: ColorFilter.mode(
                    currentIndex == 3
                        ? AppColors.primaryRefix
                        : AppColors.neutral400,
                    BlendMode.srcIn),
              )),
        ],
      ),
    );
  }
}
