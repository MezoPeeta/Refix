import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../core/theme/colors.dart';
import '../../core/theme/radii.dart';
import '../../core/widgets/btns.dart';
import '../auth/data/auth_data.dart';
import 'domain/tasks_domain.dart';
import 'in_task.dart';

class OnWardScreen extends StatefulWidget {
  const OnWardScreen({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  State<OnWardScreen> createState() => _OnWardScreenState();
}

class _OnWardScreenState extends State<OnWardScreen> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final Service service = widget.data["service"];
    final Tasks task = widget.data["task"];
    return Scaffold(
      appBar: AppBar(
        title: Text(service.name?.localized ?? "Unnamed"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            children: [
              SvgPicture.asset("assets/img/stepper.svg"),
              TextFormField(
                readOnly: true,
                initialValue: task.customer?.phone ?? "phone",
                decoration: InputDecoration(
                  filled: true,
                  suffixIcon: GestureDetector(
                    onTap: () async {
                      final url = "tel:${task.customer?.phone}";
                      if (!await launchUrlString(url)) {
                        throw Exception('Could not launch $url');
                      }
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.primaryRefix,
                            borderRadius: BorderRadius.circular(8)),
                        child: Icon(
                          Icons.phone,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
              Text(
                "Press the call button to contact the client directly",
                style: TextStyle(
                    color: AppColors.neutral300, fontSize: AppTextSize.two),
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
                initialValue: DateFormat.yMd().format(task.createdAt!),
                decoration: InputDecoration(
                  hintText: "Date of visit",
                ),
              ),
              TextFormField(
                readOnly: true,
                initialValue: service.details?.localized,
                validator: (v) {
                  if (v!.isEmpty) {
                    return "Please enter details in english";
                  }
                  return null;
                },
                maxLines: 5,
                maxLength: 200,
                decoration:
                    const InputDecoration(hintText: "The details (English)"),
              ),
              TextFormField(
                readOnly: true,
                initialValue: task.customer?.longitude.toString(),
                decoration: InputDecoration(
                  hintText: "Add Address",
                  filled: true,
                  suffixIcon: GestureDetector(
                    onTap: () {
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
              Consumer(builder: (context, ref, child) {
                return PrimaryButton(
                    text: "Start The Inspection Process",
                    loading: loading,
                    onPressed: () async {
                      setState(() {
                        loading = true;
                      });
                      await ref.read(updateBookingProvider(
                        id: task.id,
                        status: "ON_WAY",
                      ).future);
                      setState(() {
                        loading = false;
                      });

                      context.push("/inspection",
                          extra: {"service": service, "task": task});
                    });
              })
            ],
          ),
        ),
      ),
    );
  }
}
