import 'package:dashboard/src/screens/booking/data/booking.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/btns.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/radii.dart';

final getBookingInfoProvider = StateProvider<BookingElement?>((ref) {
  return null;
});

class BookingScreen extends ConsumerWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final details = ref.watch(getBookingInfoProvider);
    print("Furst Image: ${details?.imagesBeforeReaper.first}");
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
                          ServiceContainer(name: details!.services.first.name),
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
                                borderRadius:
                                    BorderRadius.circular(AppRadii.lg)),
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
                              readOnly: true,
                              initialValue:
                                  details.customer.longitude.toString(),
                              decoration: const InputDecoration(
                                hintText: "Add Address",
                                filled: true,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          IconButton(
                              onPressed: () async {
                                final lat = details.customer.latitude;
                                final long = details.customer.longitude;

                                if (!await launchUrl(Uri.parse(
                                    "https://maps.google.com/?q=$lat,$long"))) {
                                  throw Exception('Could not launch URL');
                                }
                              },
                              icon: const Icon(Icons.location_city))
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
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Cost Of Service",
                              style: TextStyle(
                                  fontSize: AppTextSize.two,
                                  color: Colors.white),
                            ),
                            Text(
                              "12.5 SAR",
                              style: TextStyle(
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
                        const AddedImage(
                          path: "",
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
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Worker Name",
                          filled: true,
                          suffixIcon: SvgPicture.asset(
                            "assets/img/services/location.svg",
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
                      decoration: const InputDecoration(
                        hintText: "Add Notes",
                        filled: true,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SecondaryButton(text: "Complete", onPressed: () {})
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

class TextHeader extends StatelessWidget {
  const TextHeader(
      {super.key, required this.text, this.fontWeight = FontWeight.w500});

  final String text;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: AppTextSize.three.toDouble(), fontWeight: fontWeight),
    );
  }
}

class AddedImage extends StatelessWidget {
  const AddedImage({
    super.key,
    required this.path,
  });

  final String path;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          width: 77,
          height: 80,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://refix-api.onrender.com/$path",
                  )),
              borderRadius: BorderRadius.circular(AppRadii.lg)),
        ),
        GestureDetector(
          onTap: () {},
          child: const CircleAvatar(
            backgroundColor: AppColors.white,
            foregroundColor: AppColors.black,
            radius: 10,
            child: Icon(
              Icons.close,
              size: 15,
            ),
          ),
        )
      ],
    );
  }
}

class ServiceContainer extends StatefulWidget {
  const ServiceContainer({super.key, required this.name});

  final String name;

  @override
  State<ServiceContainer> createState() => _ServiceContainerState();
}

class _ServiceContainerState extends State<ServiceContainer> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(AppRadii.md),
      padding: isSelected ? const EdgeInsets.all(8) : EdgeInsets.zero,
      color: isSelected ? AppColors.primaryRefix : Colors.transparent,
      child: GestureDetector(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: Column(
          children: [
            Container(
              height: 52,
              width: isSelected ? 110.67 : 116.67,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadii.lg),
                  color: isSelected
                      ? AppColors.primaryRefix
                      : AppColors.neutral100),
            ),
            SizedBox(height: isSelected ? 5 : 13),
            Text(widget.name)
          ],
        ),
      ),
    );
  }
}
