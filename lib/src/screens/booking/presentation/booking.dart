import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
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

  String btnText(BuildContext context, String status, String? paymentMethod,
      {bool isPaid = false}) {
    if (paymentMethod == null) {
      if (status == "PENDING") {
        return context.tr.show;
      }
      return context.tr.addReview;
    }
    if (paymentMethod == "CARD" && isPaid == false) {
      return context.tr.pay;
    }
    return context.tr.show;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookings = ref.watch(getUserBookingProvider);
    final status = ref.watch(currentStatusProvider);
    final discount =
        ref.watch(getDiscountProvider(pageName: "Booking-Current"));
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
      body: RefreshIndicator.adaptive(
        onRefresh: () async => ref.invalidate(getUserBookingProvider),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                        ref.read(currentStatusProvider.notifier).state =
                            "CLOSED";
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
                  child: discount.when(
                      data: (data) {
                        if (data?.active == false) {
                          return const SizedBox.shrink();
                        }
                        return Container(
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
                                    data?.heading?.localized ?? "",
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
                        );
                      },
                      error: (e, s) {
                        return const Text("Error loading discount");
                      },
                      loading: () =>
                          const CircularProgressIndicator.adaptive())),
              const SizedBox(
                height: 16,
              ),
              bookings.when(
                  data: (data) {
                    final bookings = data.where((e) {
                      if (status == "PENDING") {
                        return e.status == "PENDING" || e.status == "ASSIGNED";
                      }
                      return e.status == "CLOSED";
                    }).toList();
                    if (bookings.isEmpty) {
                      return Center(
                        child: Text(context.tr.notBookedYet),
                      );
                    }
                    return ListView.separated(
                        itemCount: bookings.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, _) {
                          return const SizedBox(
                            height: 10,
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
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(AppRadii.lg),
                                      color: AppColors.neutral50),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "https://api.refixapp.com/${data[index].services.first.image}",
                                    width: 33,
                                    height: 34,
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.broken_image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                ),
                                const Spacer(),
                                SecondaryButton(
                                  text: btnText(context, status,
                                      bookings[index].paymentMethod,
                                      isPaid: bookings[index].isPaid),
                                  onPressed: () {
                                    if (bookings[index].isPaid == false &&
                                        bookings[index].paymentMethod ==
                                            "CARD") {
                                      context.push("/payment_method");
                                      return;
                                    }
                                    context.pushNamed("InBooking",
                                        extra: bookings[index]);
                                  },
                                  size: const Size(75, 40),
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
                  loading: () => const Center(child: SizedBox.shrink()))
            ],
          ),
        ),
      ),
    );
  }
}
