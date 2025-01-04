import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:refix/src/core/localization/domain.dart';
import 'package:refix/src/core/ui/theme/colors.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/core/ui/widgets/button.dart';
import 'package:refix/src/screens/services/domain/booking_domain.dart';

final currentStatusProvider = StateProvider<String>((ref) => "PENDING");

class BookingScreen extends ConsumerWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookings = ref.watch(getUserBookingProvider);
    final status = ref.watch(currentStatusProvider);

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  color: AppColors.neutralRefix,
                  border: Border.all(),
                  shape: BoxShape.circle),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.notifications,
                  color: AppColors.neutralRefix,
                  size: 16,
                ),
                onPressed: () => context.push("/notifications"),
              ),
            ),
          )
        ],
        title: Text(
          context.tr.booking,
          style: const TextStyle(
              fontWeight: FontWeight.w500, fontSize: AppTextSize.three),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      ref.read(currentStatusProvider.notifier).state =
                          "PENDING";
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: status == "PENDING"
                              ? AppColors.primaryRefix
                              : AppColors.neutralRefix,
                          borderRadius: BorderRadius.circular(AppRadii.lg)),
                      child: Text(
                        context.tr.current,
                        style: const TextStyle(color: AppColors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      ref.read(currentStatusProvider.notifier).state = "CLOSED";
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: status == "CLOSED"
                              ? AppColors.primaryRefix
                              : AppColors.neutralRefix,
                          borderRadius: BorderRadius.circular(AppRadii.lg)),
                      child: Text(
                        context.tr.closed,
                        style: const TextStyle(color: AppColors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 144,
                decoration: BoxDecoration(
                    color: AppColors.secondaryRefix,
                    borderRadius: BorderRadius.circular(AppRadii.lg)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          context.tr.discount_next("60%"),
                          style: const TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          const CircleAvatar(
                            backgroundColor: AppColors.primaryRefix,
                            radius: 40,
                          ),
                          Lottie.asset(
                              "assets/img/services/present_lottie.json",
                              width: 80)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            bookings.when(
                data: (data) {
                  final bookings =
                      data.where((e) => e.status == status).toList();
                  return ListView.separated(
                      itemCount: bookings.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, _) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 16),
                          child: Text(
                            context.tr.fineBooking("20"),
                            style: const TextStyle(
                                color: AppColors.neutral300,
                                fontSize: AppTextSize.one),
                          ),
                        );
                      },
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(16),
                                height: 66,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(AppRadii.lg),
                                    color: AppColors.neutral50),
                                child: SvgPicture.asset(
                                  "assets/img/home/fire.svg",
                                  width: 33,
                                  height: 34,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    bookings[index]
                                        .services
                                        .first
                                        .name
                                        .localized,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    bookings[index]
                                        .services
                                        .first
                                        .details
                                        .localized,
                                    style: const TextStyle(
                                      fontSize: AppTextSize.two,
                                    ),
                                  )
                                ],
                              ),
                              const Spacer(),
                              SecondaryButton(
                                text: context.tr.show,
                                onPressed: () => context.push("/in_booking"),
                                size: const Size(74, 40),
                              )
                            ],
                          ),
                        );
                      });
                },
                error: (e, s) {
                  log("Booking Error", error: e, stackTrace: s);
                  return Text("Error: $e");
                },
                loading: () =>
                    const Center(child: CircularProgressIndicator.adaptive()))
          ],
        ),
      ),
    );
  }
}
