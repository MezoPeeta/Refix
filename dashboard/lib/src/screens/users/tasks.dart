import 'package:dashboard/src/screens/auth/data/auth_data.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../core/theme/btns.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/radii.dart';

final workerProvider = StateProvider<Worker?>((ref) => null);

class TasksScreen extends ConsumerStatefulWidget {
  const TasksScreen({super.key});

  @override
  ConsumerState<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends ConsumerState<TasksScreen> {
  DateTime selectedDate = DateTime.now();
  String selectedState = "ASSIGNED";
  @override
  Widget build(BuildContext context) {
    final tasks = ref.watch(workerProvider)?.tasks?[0].services;
    
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                spacing: 16,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DatePicker(
                        DateTime.now(),
                        height: 100,
                        initialSelectedDate: selectedDate,
                        selectionColor: AppColors.primaryRefix,
                        selectedTextColor: Colors.white,
                        onDateChange: (selectedData) {
                          setState(() {
                            selectedDate = selectedData;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                      child: UserInfoCard(
                    worker: ref.watch(workerProvider)!,
                  ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                          borderRadius: BorderRadius.circular(AppRadii.lg)),
                      child: const Text(
                        "Current",
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
                          borderRadius: BorderRadius.circular(AppRadii.lg)),
                      child: const Text(
                        "Closed",
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
                          borderRadius: BorderRadius.circular(AppRadii.lg)),
                      child: const Text(
                        "Canceled",
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
            ListView.builder(
                itemCount: tasks?.length ?? 0,
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
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppRadii.lg),
                              color: AppColors.neutral50),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tasks?[index].name!.en ?? "Unnamed",
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              tasks?[index].details!.en ?? "No details",
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
        ),
      ),
    );
  }
}

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({super.key, required this.worker});

  final Worker worker;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "User Information",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              TextButton(
                onPressed: () {
                  context.push("/worker/edit", extra: worker);
                },
                child: const Text(
                  "Edit",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildInfoRow("Username", worker.username, Colors.green),
          const SizedBox(height: 8),
          _buildInfoRow("Phone Number", worker.phone ?? "-"),
          const SizedBox(height: 8),
          _buildInfoRow("Company User Name", worker.companyName),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, [Color? valueColor]) {
    return RichText(
      text: TextSpan(
        text: "$label : ",
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        children: [
          TextSpan(
            text: value,
            style: TextStyle(
              color: valueColor ?? Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
