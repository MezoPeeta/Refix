import 'package:dashboard/src/core/theme/radii.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/theme/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutral50,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              spacing: 16,
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(AppRadii.lg)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 16,
                          children: [
                            Text(
                              "Today's Money",
                              style: TextStyle(
                                  color: AppColors.primaryRefix,
                                  fontSize: AppTextSize.two,
                                  fontWeight: FontWeight.w700),
                            ),
                            Row(
                              spacing: 7,
                              children: [
                                Text(
                                  "\$53,000",
                                  style: TextStyle(
                                      fontSize: AppTextSize.one,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "+55%",
                                  style: TextStyle(
                                    fontSize: AppTextSize.one,
                                    color: AppColors.primaryRefix,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColors.primaryRefix,
                              borderRadius: BorderRadius.circular(AppRadii.md)),
                          child: SvgPicture.asset("assets/img/home/money.svg"),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(AppRadii.lg)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 16,
                          children: [
                            Text(
                              "New User",
                              style: TextStyle(
                                  color: AppColors.primaryRefix,
                                  fontSize: AppTextSize.two,
                                  fontWeight: FontWeight.w700),
                            ),
                            Row(
                              spacing: 7,
                              children: [
                                Text(
                                  "\$53,000",
                                  style: TextStyle(
                                      fontSize: AppTextSize.one,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "+55%",
                                  style: TextStyle(
                                    fontSize: AppTextSize.one,
                                    color: AppColors.primaryRefix,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColors.primaryRefix,
                              borderRadius: BorderRadius.circular(AppRadii.md)),
                          child: SvgPicture.asset(
                            "assets/img/navbar/users.svg",
                            colorFilter: const ColorFilter.mode(
                                Colors.white, BlendMode.srcIn),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(AppRadii.lg)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          spacing: 16,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Active Worker",
                              style: TextStyle(
                                  color: AppColors.primaryRefix,
                                  fontSize: AppTextSize.two,
                                  fontWeight: FontWeight.w700),
                            ),
                            Row(
                              spacing: 7,
                              children: [
                                Text(
                                  "\$53,000",
                                  style: TextStyle(
                                      fontSize: AppTextSize.one,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "+55%",
                                  style: TextStyle(
                                    fontSize: AppTextSize.one,
                                    color: AppColors.primaryRefix,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColors.primaryRefix,
                              borderRadius: BorderRadius.circular(AppRadii.md)),
                          child: SvgPicture.asset("assets/img/home/worker.svg"),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(AppRadii.lg)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 16,
                          children: [
                            Text(
                              "New Booking",
                              style: TextStyle(
                                  color: AppColors.primaryRefix,
                                  fontSize: AppTextSize.two,
                                  fontWeight: FontWeight.w700),
                            ),
                            Row(
                              spacing: 7,
                              children: [
                                Text(
                                  "\$53,000",
                                  style: TextStyle(
                                      fontSize: AppTextSize.one,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "+55%",
                                  style: TextStyle(
                                    fontSize: AppTextSize.one,
                                    color: AppColors.primaryRefix,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColors.primaryRefix,
                              borderRadius: BorderRadius.circular(AppRadii.md)),
                          child: SvgPicture.asset(
                            "assets/img/navbar/booking.svg",
                            colorFilter: const ColorFilter.mode(
                                Colors.white, BlendMode.srcIn),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(AppRadii.lg)),
                child: const Column(
                  children: [
                    Text("Active Workers"),
                    ListTile( 
                      title: Text("S"),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
