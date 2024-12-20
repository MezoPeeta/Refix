import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/screens/home/data/home_data.dart';
import 'package:refix/src/screens/services/presentation/final_step.dart';
import 'package:refix/src/screens/services/presentation/more_services.dart';

import '../../../core/ui/widgets/button.dart';

final serviceForPhotoProvider = StateProvider<Service?>((ref) => null);

class TackphotoScreen extends ConsumerWidget {
  const TackphotoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final service = ref.watch(choosenService);
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              service?.name ?? "Please enter service name",
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
          const Text(
            "Please App/Tack Photo the issue.",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),
          Text(
            "This sentence is used as a substitute for real text in the fields of printing and design.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: AppTextSize.one.toDouble()),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Consumer(builder: (context, ref, child) {
          return PrimaryButton(
            text: "Add/Track Photo",
            onPressed: () async {
              final ImagePicker picker = ImagePicker();
              final XFile? photo =
                  await picker.pickImage(source: ImageSource.camera);
              ref.read(imageProvider.notifier).state = photo;
              if (!context.mounted) return;
              context.push("/final_step");
            },
          );
        }),
      ),
    );
  }
}
