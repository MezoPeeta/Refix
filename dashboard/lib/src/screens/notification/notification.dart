import 'package:dashboard/src/core/theme/btns.dart';
import 'package:dashboard/src/core/theme/radii.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'data/source.dart';

class NotificationScreen extends ConsumerStatefulWidget {
  const NotificationScreen({super.key});

  @override
  ConsumerState<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends ConsumerState<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    const rules = AsyncValue<List<Notifications>>.data([]);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                spacing: 16,
                children: [
                  Text(
                    "All (${rules.value?.length ?? 0})",
                    style: const TextStyle(
                        fontSize: AppTextSize.three,
                        fontWeight: FontWeight.w500),
                  ),
                  Expanded(
                      child: SecondaryButton(
                          text: "Add New Notification +",
                          onPressed: () {
                            context.push("/notification/edit");
                          })),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            rules.when(
                data: (data) {
                  return Expanded(
                    child: PaginatedDataTable(
                      showCheckboxColumn: true,
                      showFirstLastButtons: false,
                      showEmptyRows: false,
                      columns: const [
                        DataColumn(
                            label: Text(
                          "Name",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        DataColumn(
                            label: Text(
                          "Details",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        DataColumn(
                            label: Text(
                          "Date",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      ],
                      source: NotificationDataSource(data, context),
                    ),
                  );
                },
                error: (e, s) {
                  debugPrint("Error: $e");
                  return const Text("Error");
                },
                loading: () =>
                    const Center(child: CircularProgressIndicator())),
          ],
        ));
  }
}
