import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:refix/src/core/ui/theme/colors.dart';
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
    HomeScreen(),
    const BookingScreen(),
    const PointsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.white,
        systemNavigationBarIconBrightness: Brightness.light));
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
              label: "Home",
              icon: SvgPicture.asset(
                "assets/img/home.svg",
                colorFilter: ColorFilter.mode(
                    currentIndex == 0
                        ? AppColors.primaryRefix
                        : AppColors.neutral400,
                    BlendMode.srcIn),
              )),
          BottomNavigationBarItem(
              label: "Booking",
              icon: SvgPicture.asset(
                "assets/img/booking.svg",
                colorFilter: ColorFilter.mode(
                    currentIndex == 1
                        ? AppColors.primaryRefix
                        : AppColors.neutral400,
                    BlendMode.srcIn),
              )),
          BottomNavigationBarItem(
              label: "Points",
              icon: SvgPicture.asset(
                "assets/img/points.svg",
                colorFilter: ColorFilter.mode(
                    currentIndex == 2
                        ? AppColors.primaryRefix
                        : AppColors.neutral400,
                    BlendMode.srcIn),
              )),
        ],
      ),
    );
  }
}
