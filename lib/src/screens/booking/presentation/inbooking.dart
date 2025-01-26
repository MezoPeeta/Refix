import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:refix/src/core/localization/domain.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/core/ui/widgets/button.dart';
import 'package:refix/src/screens/services/domain/booking_domain.dart';
import 'package:refix/src/screens/services/presentation/final_step.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../core/ui/theme/colors.dart';
import '../../../core/ui/widgets/header.dart';
import '../../services/data/bookin_data.dart';
import '../../services/presentation/services.dart';

class InbookingScreen extends StatelessWidget {
  const InbookingScreen({super.key, required this.booking});
  final Booking booking;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextHeader(
              text: context.tr.selectServiceName,
              fontWeight: FontWeight.w500,
            ),
            Text(
              context.tr.fillInputBox,
              style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: AppTextSize.one,
                  color: AppColors.neutralRefix),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 100,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      ),
                  itemCount: booking.services.length + 1,
                  itemBuilder: (context, index) {
                    if (index == booking.services.length) {
                      return Container(
                        width: 116.67,
                        height: 101,
                        decoration: BoxDecoration(
                            color: AppColors.neutral100,
                            borderRadius: BorderRadius.circular(AppRadii.lg)),
                        child: SvgPicture.asset(
                          "assets/img/home/add_disabled.svg",
                          width: 39,
                          height: 39,
                          fit: BoxFit.scaleDown,
                        ),
                      );
                    }
                    return ServiceContainer(
                      service: booking.services[index],
                      isSelected: true,
                      onPressed: () {},
                    );
                  }),
            ),
            const SizedBox(
              height: 24,
            ),
            TextHeader(
              text: context.tr.photoYourProblem,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 80,
                    child: ListView.separated(
                        itemCount: booking.imagesBeforeReaper.length + 1,
                        separatorBuilder: (context, index) => const SizedBox(
                              width: 16,
                            ),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          if (index == booking.imagesBeforeReaper.length) {
                            return Container(
                              width: 77,
                              height: 80,
                              decoration: BoxDecoration(
                                  color: AppColors.neutral100,
                                  borderRadius:
                                      BorderRadius.circular(AppRadii.lg)),
                              child: SvgPicture.asset(
                                "assets/img/home/add_disabled.svg",
                                width: 39,
                                height: 39,
                                fit: BoxFit.scaleDown,
                              ),
                            );
                          }
                          return AddedImage(
                            path:
                                "https://api.refixapp.com/${booking.imagesBeforeReaper[index]}",
                            onRemove: () {},
                            isFile: false,
                          );
                        }),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Consumer(
              builder: (context, ref, child) {
                final locationAsync = ref.watch(
                  getLocationProvider(
                    latitude: booking.customer.latitude!,
                    longitude: booking.customer.longitude!,
                  ),
                );

                return locationAsync.when(
                  data: (location) {
                    return TextFormField(
                      key: ValueKey(
                          'data-$location'), // Unique key for data state
                      readOnly: true,
                      initialValue: location,
                      decoration: InputDecoration(
                        hintText: "Add Address",
                        filled: true,
                        suffixIcon: SvgPicture.asset(
                          "assets/img/services/location.svg",
                          width: 11,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    );
                  },
                  loading: () {
                    return TextFormField(
                      key: const ValueKey(
                          'loading'), // Unique key for loading state
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: "Loading address...",
                        filled: true,
                        suffixIcon: SvgPicture.asset(
                          "assets/img/services/location.svg",
                          width: 11,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    );
                  },
                  error: (error, stack) => Text('Error: $error'),
                );
              },
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              initialValue: DateFormat.yMEd().format(booking.appointmentDate),
              readOnly: true,
              decoration: InputDecoration(
                  hintText: "Pick Date",
                  suffixIcon: SvgPicture.asset(
                    "assets/img/services/calendar.svg",
                    width: 11,
                    fit: BoxFit.scaleDown,
                  )),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Consumer(builder: (context, ref, child) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: booking.status == "CLOSED"
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    !booking.reviewed
                        ? PrimaryButton(
                            onPressed: () => context.push("/booking_reviews",
                                extra: booking),
                            text: context.tr.addReview,
                          )
                        : const SizedBox.shrink(),
                    booking.problemResolved == null
                        ? ErrorButton(
                            text: context.tr.report_problem_not_resolved,
                            onPressed: () {
                              context.push("/booking/report", extra: booking);
                            })
                        : const SizedBox.shrink()
                  ],
                )
              : Visibility(
                  visible: booking.status == "PENDING",
                  child: TextButton(
                      onPressed: () async {
                        final result = await ref.read(updateBookingProvider(
                                booking: booking.copyWith(status: "CANCELLED"))
                            .future);
                        if (!context.mounted) return;

                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(result)));
                      },
                      child: Text(
                        context.tr.cancelBooking,
                        style: const TextStyle(
                            color: AppColors.errorRefix,
                            fontSize: AppTextSize.three,
                            fontWeight: FontWeight.w500),
                      )),
                ),
        );
      }),
    );
  }
}
