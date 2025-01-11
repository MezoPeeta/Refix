import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:worker/src/core/localization/domain.dart';
import 'package:worker/src/screens/auth/data/auth_data.dart';
import 'package:worker/src/screens/auth/domain/auth_domain.dart';
import 'package:worker/src/screens/home/domain/home_domain.dart';

import '../../core/theme/colors.dart';
import '../../core/theme/radii.dart';
import '../../core/widgets/btns.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  String calculatePercentage(List<Tasks>? data, List<Tasks>? finishedTasks) {
    final dataLength = data?.length ?? 0;
    return ((finishedTasks?.length ?? 0 / dataLength) * 100).toString();
  }

  double doublePercentage(List<Tasks>? data, List<Tasks>? finishedTasks) {
    final dataLength = data?.length ?? 0;
    return (finishedTasks?.length ?? 0 / dataLength).toDouble();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(getTasksProvider);
    final currentWorker = ref.watch(getCurrentUserProvider).value?.username;

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  color: AppColors.neutralRefix,
                  border: Border.all(),
                  shape: BoxShape.circle),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.notifications,
                  color: AppColors.neutralRefix,
                  size: 16,
                ),
                onPressed: () => context.push("/notifications"),
              ),
            ),
          )
        ],
        title: Text(
          currentWorker ?? "",
          style: const TextStyle(
              fontWeight: FontWeight.w500, fontSize: AppTextSize.three),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: tasks.when(
                data: (data) {
                  final finishedTasks =
                      data.where((e) => e.status == "CLOSED").toList();
                  final tasks =
                      data.where((e) => e.status == "ASSIGNED").toList();
                  return Column(
                    children: [
                      Container(
                        height: 144,
                        decoration: BoxDecoration(
                            color: AppColors.secondaryRefix,
                            borderRadius: BorderRadius.circular(AppRadii.lg)),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  "your todays task almost done!",
                                  style: const TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(
                                    height: 90,
                                    width: 90,
                                    child: CircularProgressIndicator(
                                      value: doublePercentage(
                                          tasks, finishedTasks),
                                      strokeWidth: 5,
                                      backgroundColor: Colors.white,
                                      valueColor: AlwaysStoppedAnimation(
                                          AppColors.primaryRefix),
                                    ),
                                  ),
                                  Text(
                                    calculatePercentage(tasks, finishedTasks),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: AppTextSize.four,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Today's tasks",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColors.primary100,
                                  borderRadius: BorderRadius.circular(8)),
                              padding: EdgeInsets.all(16),
                              child: Text(tasks.length.toString()),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      tasks.isEmpty
                          ? Text("No Task")
                          : ListView.separated(
                              itemCount: tasks.first.services.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, _) {
                                return SizedBox(
                                  height: 16,
                                );
                              },
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(16),
                                        height: 66,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://refix-api.onrender.com/${tasks.first.services[index].image}")),
                                            borderRadius: BorderRadius.circular(
                                                AppRadii.lg),
                                            color: AppColors.neutral50),
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            tasks.first.services[index].name!
                                                .localized
                                                .toString(),
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            tasks.first.services[index].details!
                                                .localized
                                                .toString(),
                                            style: const TextStyle(
                                              fontSize: AppTextSize.two,
                                            ),
                                          )
                                        ],
                                      ),
                                      const Spacer(),
                                      SecondaryButton(
                                        text: context.tr.show,
                                        onPressed: () => context
                                            .push("/intasks", extra: {
                                          "service": data.first.services[index],
                                          "task": data.first
                                        }),
                                        size: const Size(74, 40),
                                      )
                                    ],
                                  ),
                                );
                              })
                    ],
                  );
                },
                error: (e, s) => Text("Error"),
                loading: () =>
                    Center(child: CircularProgressIndicator.adaptive()))),
      ),
    );
  }
}
