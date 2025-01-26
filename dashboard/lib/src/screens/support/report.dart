import 'package:dashboard/src/screens/base/base.dart';
import 'package:dashboard/src/screens/booking/data/booking.dart';
import 'package:dashboard/src/screens/support/rates/domain/rates_domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../app.dart';
import '../../core/theme/btns.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/radii.dart';
import '../booking/presentation/booking.dart';

final reportProvider = StateProvider<BookingElement?>((ref) => null);

class ReportDetailsScreen extends ConsumerStatefulWidget {
  const ReportDetailsScreen({super.key});

  @override
  ConsumerState<ReportDetailsScreen> createState() =>
      _ReportDetailsScreenState();
}

class _ReportDetailsScreenState extends ConsumerState<ReportDetailsScreen> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final details = ref.watch(reportProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 24,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const PrevButton(),
                      const Center(child: Text("Client Details")),
                      const Divider(),
                      const TextHeader(
                        text: "Select Service Name",
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          ServiceContainer(
                              image:
                                  "https://api.refixapp.com/${details!.services.first.image}",
                              name: details.services.first.name?.en ?? ""),
                          const SizedBox(
                            width: 24,
                          ),
                          Container(
                            width: 116.67,
                            height: 101,
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
                          )
                        ],
                      ),
                      const Text(
                        "If you have any questions, please fill in the input box below.If you have any questions, please fill in the input box below.",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: AppTextSize.one,
                            color: AppColors.neutralRefix),
                      ),
                      const SizedBox(height: 24),
                      const SizedBox(
                        height: 24,
                      ),
                      const TextHeader(
                        text: "Photo your problem",
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
                                  itemCount:
                                      details.imagesBeforeReaper.length + 1,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        width: 16,
                                      ),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    if (index ==
                                        details.imagesBeforeReaper.length) {
                                      return Container(
                                        width: 77,
                                        height: 80,
                                        decoration: BoxDecoration(
                                            color: AppColors.neutral100,
                                            borderRadius: BorderRadius.circular(
                                                AppRadii.lg)),
                                        child: SvgPicture.asset(
                                          "assets/img/home/add_disabled.svg",
                                          width: 39,
                                          height: 39,
                                          fit: BoxFit.scaleDown,
                                        ),
                                      );
                                    }
                                    return AddedImage(
                                      path: details.imagesBeforeReaper[index],
                                    );
                                  }),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        readOnly: true,
                        initialValue: details.customer.username.toString(),
                        decoration: const InputDecoration(
                          hintText: "Customer Name",
                          filled: true,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const TextHeader(
                        text: "Select Service Name",
                        fontWeight: FontWeight.w500,
                      ),
                      const Text(
                        "If you have any questions, please fill in the input box below.If you have any questions, please fill in the input box below.",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: AppTextSize.one,
                            color: AppColors.neutralRefix),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              initialValue: details.customer.phone,
                              decoration: const InputDecoration(
                                hintText: "Phone Number",
                                filled: true,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          IconButton(
                              onPressed: () async {
                                await Clipboard.setData(ClipboardData(
                                    text: details.customer.phone.toString()));
                                if (!context.mounted) return;
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Copied to clipboard!")));
                              },
                              icon: const Icon(Icons.phone))
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        readOnly: true,
                        initialValue:
                            DateFormat.yMd().format(details.appointmentDate),
                        decoration: InputDecoration(
                            hintText: "Pick Date",
                            suffixIcon: SvgPicture.asset(
                              "assets/img/services/calendar.svg",
                              width: 11,
                              fit: BoxFit.scaleDown,
                            )),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        maxLength: 200,
                        maxLines: 8,
                        readOnly: true,
                        decoration: const InputDecoration(
                          hintText: "Add Notes",
                          filled: true,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        height: 58,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: AppColors.secondaryRefix,
                          borderRadius: BorderRadius.circular(AppRadii.lg),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Cost Of Service",
                              style: TextStyle(
                                  fontSize: AppTextSize.two,
                                  color: Colors.white),
                            ),
                            Text(
                              "${details.cost} SAR",
                              style: const TextStyle(
                                  fontSize: AppTextSize.two,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(child: Text("Worker Details")),
                    const Divider(),
                    const TextHeader(
                      text: "Photo after the repair problem",
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
                                itemCount: details.imagesAfterReaper.length + 1,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                      width: 16,
                                    ),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  if (index ==
                                      details.imagesAfterReaper.length) {
                                    return Container(
                                      width: 77,
                                      height: 80,
                                      decoration: BoxDecoration(
                                          color: AppColors.neutral100,
                                          borderRadius: BorderRadius.circular(
                                              AppRadii.lg)),
                                      child: SvgPicture.asset(
                                        "assets/img/home/add_disabled.svg",
                                        width: 39,
                                        height: 39,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    );
                                  }
                                  return AddedImage(
                                    path: details.imagesAfterReaper[index],
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      readOnly: true,
                      initialValue: details.worker?.username,
                      decoration: const InputDecoration(
                        hintText: "Worker Name",
                        filled: true,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      maxLength: 200,
                      maxLines: 8,
                      readOnly: true,
                      decoration: const InputDecoration(
                        hintText: "Add Notes",
                        filled: true,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    details.resolved
                        ? SecondaryButton(
                            text: "It's already solved", onPressed: () {})
                        : SecondaryButton(
                            loading: loading,
                            text: "Mark as solved",
                            onPressed: () async {
                              setState(() {
                                loading = true;
                              });
                              final response = await ref.read(
                                  resolveBookingProvider(bookingID: details.id)
                                      .future);
                              ref.invalidate(getReportsProvider);
                              context.pop();
                              ref.read(scaffoldMessengerPod).showSnackBar(
                                  SnackBar(content: Text(response)));

                              setState(() {
                                loading = false;
                              });
                            })
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
