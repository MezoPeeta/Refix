import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:refix/src/core/ui/theme/radii.dart';

import '../../../core/ui/widgets/button.dart';

class TackphotoScreen extends StatelessWidget {
  const TackphotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text(
              "Enter the name of the service here",
              style: TextStyle(fontSize: AppTextSize.two),
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
        child: PrimaryButton(
          text: "Add/Track Photo",
          onPressed: () {},
        ),
      ),
    );
  }
}
