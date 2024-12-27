import 'package:dashboard/src/screens/users/domain/source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theme/btns.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/radii.dart';
import '../../users/domain/users_domain.dart';
import 'booking.dart';

class BookingConfShow extends ConsumerStatefulWidget {
  const BookingConfShow({super.key});

  @override
  ConsumerState<BookingConfShow> createState() => _BookingConfShowState();
}

class _BookingConfShowState extends ConsumerState<BookingConfShow> {
  final int _page = 1;

  String? query;
  String? workerID;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final details = ref.watch(getBookingInfoProvider);
    final workers =
        ref.watch(getAllWorkersProvider(page: _page, query: query)).value;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      name: details!.services.first.name,
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Container(
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
                    AddedImage(
                      path: details.imagesBeforeReaper.first,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Container(
                      width: 77,
                      height: 80,
                      decoration: BoxDecoration(
                          color: AppColors.neutral100,
                          borderRadius: BorderRadius.circular(AppRadii.lg)),
                      child: SvgPicture.asset(
                        "assets/img/home/add_disabled.svg",
                        width: 39,
                        height: 39,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
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
                TextFormField(
                  initialValue: details.customer.phone,
                  decoration: const InputDecoration(
                    hintText: "Phone Number",
                    filled: true,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  initialValue: details.customer.latitude.toString(),
                  decoration: const InputDecoration(
                    hintText: "Add Address",
                    filled: true,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  maxLength: 200,
                  initialValue: details.notes,
                  maxLines: 8,
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
                    border: Border.all(color: AppColors.primaryRefix),
                    borderRadius: BorderRadius.circular(AppRadii.lg),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Cost Of Service",
                        style: TextStyle(fontSize: AppTextSize.two),
                      ),
                      Text(
                        "12.5 SAR",
                        style: TextStyle(fontSize: AppTextSize.two),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                PrimaryButton(
                    text: "Add Worker",
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  DropdownButtonFormField(
                                    value: workerID,
                                    decoration: const InputDecoration(
                                        hintText: "Pick Worker"),
                                    items: workers
                                        ?.map((e) => DropdownMenuItem(
                                            value: e.id,
                                            child: Text(e.username)))
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        workerID = value;
                                      });
                                    },
                                  ),
                                  PrimaryButton(
                                      text: "Confirm",
                                      onPressed: () async {
                                        setState(() {
                                          loading = true;
                                        });
                                        final status = await ref.read(
                                            assignWorkerToBookingProvider(
                                                    bookingID: details.id,
                                                    workerID: workerID ?? "")
                                                .future);
                                        setState(() {
                                          loading = false;
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(status ?? "")));
                                      },
                                      loading: loading)
                                ],
                              ),
                            );
                          });
                    },
                    loading: false)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
