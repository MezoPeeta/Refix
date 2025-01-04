import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:refix/src/core/localization/domain.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/screens/home/data/home_data.dart';

import '../../../core/ui/widgets/button.dart';

final serviceForPhotoProvider = StateProvider<Service?>((ref) => null);

class TackphotoScreen extends ConsumerWidget {
  const TackphotoScreen({super.key, required this.service});

  final Service service;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              service.name.localized,
              style: const TextStyle(fontSize: AppTextSize.two),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/img/services/progress_fill.svg"),
                const SizedBox(
                  width: 16,
                ),
                SvgPicture.asset("assets/img/services/progress_fill.svg"),
                const SizedBox(
                  width: 16,
                ),
                SvgPicture.asset("assets/img/services/progress.svg")
              ],
            )
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/img/services/upload_image.svg"),
          Text(
            context.tr.appTrackPhotoIssue,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),
          Text(
            context.tr.substituteTextExplanation,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: AppTextSize.one.toDouble()),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Consumer(builder: (context, ref, child) {
          return PrimaryButton(
            text: context.tr.addTrackPhoto,
            onPressed: () async {
              final ImagePicker picker = ImagePicker();
              final XFile? photo =
                  await picker.pickImage(source: ImageSource.camera);
              if (!context.mounted) return;
              context.pushNamed("FinalStep", pathParameters: {
                "service": jsonEncode(service.toJson()),
                "photo": photo!.path
              });
            },
          );
        }),
      ),
    );
  }
}
