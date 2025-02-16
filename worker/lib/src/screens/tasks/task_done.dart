import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:worker/src/core/localization/domain.dart';

import '../../core/theme/colors.dart';
import '../../core/theme/radii.dart';
import '../../core/widgets/btns.dart';

class TaskDone extends StatelessWidget {
  const TaskDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16,
              children: [
                SvgPicture.asset("assets/img/check.svg"),
                Text(
                  context.tr.taskCompleted,
                  style: TextStyle(
                      fontSize: AppTextSize.six, fontWeight: FontWeight.w700),
                ),
                Text(
                  context.tr.taskCompletionMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: AppTextSize.two,
                      color: AppColors.neutralRefix,
                      fontWeight: FontWeight.w300),
                ),
                PrimaryButton(
                    text: context.tr.showAllTasks,
                    onPressed: () => context.go("/")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
