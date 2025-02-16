import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:worker/src/core/theme/colors.dart';
import 'package:worker/src/screens/auth/domain/auth_domain.dart';
import 'package:worker/src/screens/home/domain/home_domain.dart';

import '../../core/localization/domain.dart';
import '../../core/theme/radii.dart';

class TasksScreen extends ConsumerStatefulWidget {
  const TasksScreen({super.key});

  @override
  ConsumerState<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends ConsumerState<TasksScreen> {
  DateTime selectedDate = DateTime.now();
  String selectedState = "ASSIGNED";
  bool isSameDate(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  bool getStates(String currentState, String elementStatus) {
    if (currentState == "ASSIGNED") {
      return currentState != "CLOSED" && currentState != "CANCELLED";
    }
    return currentState == elementStatus;
  }

  @override
  Widget build(BuildContext context) {
    final tasks = ref.watch(getTasksProvider);
    final currentWorker = ref.watch(getCurrentUserProvider).value?.username;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          currentWorker ?? "",
          style: const TextStyle(
              fontWeight: FontWeight.w500, fontSize: AppTextSize.three),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
          child: tasks.when(
              data: (data) {
                final tasksByStatus = data.where((element) {
                  return getStates(selectedState, element.status) &&
                      isSameDate(element.appointmentDate!, selectedDate);
                }).toList();

                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DatePicker(
                        DateTime.now().subtract(Duration(days: 5)),
                        height: 100,
                        locale: ref.watch(localeNotifierProvider).languageCode,
                        initialSelectedDate: DateTime.now(),
                        selectionColor: AppColors.primaryRefix,
                        selectedTextColor: Colors.white,
                        daysCount: 15,
                        onDateChange: (selectedData) {
                          setState(() {
                            selectedDate = selectedData;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => setState(() {
                              selectedState = "ASSIGNED";
                            }),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  color: selectedState == "ASSIGNED"
                                      ? AppColors.primaryRefix
                                      : AppColors.neutralRefix,
                                  borderRadius:
                                      BorderRadius.circular(AppRadii.lg)),
                              child: Text(
                                context.tr.current,
                                style: TextStyle(color: AppColors.white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                            onTap: () => setState(() {
                              selectedState = "CLOSED";
                            }),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  color: selectedState == "CLOSED"
                                      ? AppColors.primaryRefix
                                      : AppColors.neutralRefix,
                                  borderRadius:
                                      BorderRadius.circular(AppRadii.lg)),
                              child: Text(
                                context.tr.closed,
                                style: TextStyle(color: AppColors.white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                            onTap: () => setState(() {
                              selectedState = "CANCELLED";
                            }),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  color: selectedState == "CANCELLED"
                                      ? AppColors.primaryRefix
                                      : AppColors.neutralRefix,
                                  borderRadius:
                                      BorderRadius.circular(AppRadii.lg)),
                              child: Text(
                                context.tr.cancelled,
                                style: TextStyle(color: AppColors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    tasksByStatus.isEmpty
                        ? Center(child: Text(context.tr.noTask))
                        : ListView.builder(
                            itemCount: tasksByStatus.first.services.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
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
                                      width: 66,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              AppRadii.lg),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage("https://api.refixapp.com/${tasksByStatus.first.services[index].image}")),
                                         ),
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          tasksByStatus.first.services[index]
                                                  .name?.localized ??
                                              "",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          tasksByStatus.first.services[index]
                                                  .details!.localized ??
                                              "No details",
                                          style: const TextStyle(
                                            fontSize: AppTextSize.two,
                                          ),
                                        )
                                      ],
                                    ),
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
    );
  }
}
