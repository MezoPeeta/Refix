import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../core/theme/colors.dart';
import '../../core/theme/radii.dart';
import '../../core/widgets/btns.dart';
import '../auth/data/auth_data.dart';

class TaskpaymentScreen extends StatelessWidget {
  const TaskpaymentScreen({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    final Service service = data["service"];
    final Tasks task = data["task"];

    return Scaffold(
      appBar: AppBar(
        title: Text(service.name?.localized ?? "Unnamed"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset("assets/img/stepper_3.svg"),
            Container(
              height: 58,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryRefix),
                borderRadius: BorderRadius.circular(AppRadii.lg),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Cost Of Service",
                    style: TextStyle(fontSize: AppTextSize.two),
                  ),
                  Text(
                    "${task.cost} SAR",
                    style: const TextStyle(fontSize: AppTextSize.two),
                  ),
                ],
              ),
            ),
            Text(task.paymentMethod),
            Spacer(),
            PrimaryButton(
              text: "Finish Work",
              onPressed: () => context.go("/success"),
              loading: false,
            ),
            ErrorButton(
                onPressed: () async {
                  final url = "tel:${task.customer?.phone}";
                  if (!await launchUrlString(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
                text: "Report problem")
          ],
        ),
      ),
    );
  }
}
