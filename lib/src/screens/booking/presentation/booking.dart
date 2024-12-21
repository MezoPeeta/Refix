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

class BookingScreen extends ConsumerWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookings = ref.watch(getUserBookingProvider);
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
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: AppColors.primaryRefix,
                        borderRadius: BorderRadius.circular(AppRadii.lg)),
                    child: const Text(
                      "Current",
                      style: TextStyle(color: AppColors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: AppColors.neutralRefix,
                        borderRadius: BorderRadius.circular(AppRadii.lg)),
                    child: const Text(
                      "Closed",
                      style: TextStyle(color: AppColors.white),
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
                      const Expanded(
                        child: Text(
                          "Get a 60% discount on your next booking.",
                          style: TextStyle(
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
                  return ListView.separated(
                      itemCount: 4,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, _) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 16),
                          child: Text(
                            "A fine of 20 SAR will be added if the cancellation is made after 8/15/2024.",
                            style: TextStyle(
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
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Date of visit: 12/25/2025",
                                    style: TextStyle(fontSize: AppTextSize.one),
                                  ),
                                  Text(
                                    "Name Of Service",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "Some details of service",
                                    style: TextStyle(
                                      fontSize: AppTextSize.two,
                                    ),
                                  )
                                ],
                              ),
                              const Spacer(),
                              SecondaryButton(
                                text: "Show",
                                onPressed: () => context.push("/in_booking"),
                                size: const Size(74, 40),
                              )
                            ],
                          ),
                        );
                      });
                },
                error: (e, s) {
                  debugPrint("Error: $e");
                  return const Text("Error");
                },
                loading: () =>
                    const Center(child: CircularProgressIndicator.adaptive()))
          ],
        ),
      ),
    );
  }
}
