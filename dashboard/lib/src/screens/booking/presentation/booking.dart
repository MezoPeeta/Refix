import 'package:dashboard/src/app.dart';
import 'package:dashboard/src/screens/booking/data/booking.dart';
import 'package:dashboard/src/screens/users/domain/source.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/btns.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/radii.dart';
import '../../base/base.dart';

final getBookingInfoProvider = StateProvider<BookingElement?>((ref) {
  return null;
});

class BookingScreen extends ConsumerStatefulWidget {
  const BookingScreen({super.key});

  @override
  ConsumerState<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends ConsumerState<BookingScreen> {
  bool loading = false;
  @override
  Widget build(
    BuildContext context,
  ) {
    final details = ref.watch(getBookingInfoProvider);
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
                            name: details!.services.first.name?.en ?? "",
                            image:
                                "https://api.refixapp.com/${details.services.first.image}",
                          ),
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
                        decoration: const InputDecoration(
                          hintText: "Pick Date",
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
                    const SizedBox(
                      height: 16,
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
                    "https://api.refixapp.com/$path",
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
  const ServiceContainer({super.key, required this.name, required this.image});

  final String name;
  final String image;

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
      padding: const EdgeInsets.all(8),
      color: AppColors.primaryRefix,
      child: Column(
        children: [
          Container(
            height: 52,
            width: isSelected ? 110.67 : 116.67,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadii.lg),
                image: DecorationImage(image: NetworkImage(widget.image)),
                color: AppColors.primaryRefix),
          ),
          const SizedBox(height: 5),
          Text(widget.name)
        ],
      ),
    );
  }
}
