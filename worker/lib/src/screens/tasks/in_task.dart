import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:worker/src/core/localization/domain.dart';
import 'package:worker/src/core/theme/radii.dart';

import '../../core/theme/colors.dart';
import '../../core/widgets/btns.dart';
import '../auth/data/auth_data.dart';

class InTaskScreen extends StatelessWidget {
  const InTaskScreen({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    final Service service = data["service"];
    final Tasks task = data["task"];
    return Scaffold(
      backgroundColor: AppColors.neutral100,
      appBar: AppBar(
        title: Text(service.name?.localized ?? "Unnamed"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              TextHeader(
                text: context.tr.photoYourProblem,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 80,
                child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: task.imagesBeforeRepair?.length ?? 0,
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 16,
                        ),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return AddedImage(
                        isFile: false,
                        path: task.imagesBeforeRepair?[index] ?? "",
                      );
                    }),
              ),
              TextFormField(
                readOnly: true,
                initialValue: task.customer?.username ?? "Customer Unnamed",
                decoration: InputDecoration(
                  filled: true,
                ),
              ),
              TextFormField(
                readOnly: true,
                initialValue: DateFormat.yMd().format(task.appointmentDate!),
                decoration: InputDecoration(
                  hintText: "Date of visit",
                ),
              ),
              TextFormField(
                readOnly: true,
                initialValue: service.details?.localized,
                validator: (v) {
                  if (v!.isEmpty) {
                    return context.tr.pleaseEnterDetails;
                  }
                  return null;
                },
                maxLines: 5,
                maxLength: 200,
                decoration: InputDecoration(hintText: context.tr.theDetails),
              ),
              TextFormField(
                readOnly: true,
                initialValue: task.customer?.longitude.toString(),
                decoration: InputDecoration(
                  hintText: context.tr.addAddress,
                  filled: true,
                  suffixIcon: GestureDetector(
                    onTap: () async {
                      final latitude = task.customer?.latitude ?? 0.0;
                      final longitude = task.customer?.longitude ?? 0.0;
                      MapUtils.openMap(latitude, longitude);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.primaryRefix,
                          borderRadius: BorderRadius.circular(8)),
                      child: SvgPicture.asset(
                        "assets/img/location.svg",
                        width: 11,
                        colorFilter:
                            ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                context.tr.clickOnMap,
                style: TextStyle(
                    color: AppColors.neutral300, fontSize: AppTextSize.two),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: PrimaryButton(
            text: context.tr.startTaskNow,
            onPressed: () => context
                .push("/onward", extra: {"service": service, "task": task})),
      ),
    );
  }
}

class MapUtils {
  MapUtils._();

  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (!await launchUrlString(googleUrl)) {
      throw Exception('Could not launch $googleUrl');
    }
  }
}

class FullScreenImage extends StatelessWidget {
  final String imageUrl;

  const FullScreenImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(
          child: InteractiveViewer(
            panEnabled: true,
            minScale: 0.5,
            maxScale: 4.0,
            child: imageUrl.contains("http")
                ? Image.network(
                    imageUrl,
                    fit: BoxFit.contain,
                  )
                : Image.file(File(imageUrl)),
          ),
        ),
      ),
    );
  }
}
