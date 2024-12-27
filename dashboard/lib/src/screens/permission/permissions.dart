import 'package:dashboard/src/core/theme/btns.dart';
import 'package:dashboard/src/core/theme/radii.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../navbar/navbar.dart';
import '../users/domain/source.dart';

class PermissionsScreen extends ConsumerStatefulWidget {
  const PermissionsScreen({super.key});

  @override
  ConsumerState<PermissionsScreen> createState() => _PermissionsScreenState();
}

class _PermissionsScreenState extends ConsumerState<PermissionsScreen> {
  int _page = 1;
  String? query;

  @override
  Widget build(BuildContext context) {
    final users = ref.watch(getUsersProvider(page: _page, query: query));
    // final cities = ref.watch(getLocation())
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
                    "All (${users.value?.length ?? 0})",
                    style: const TextStyle(
                        fontSize: AppTextSize.three,
                        fontWeight: FontWeight.w500),
                  ),
                  Expanded(
                      child: SecondaryButton(
                          text: "Add New User",
                          onPressed: () {
                            ref.read(currentIndexProvider.notifier).state = 17;
                          })),
                  Expanded(
                    flex: 5,
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          query = value;
                        });
                      },
                      decoration: const InputDecoration(
                          filled: true, hintText: "Search Here"),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            users.when(
                data: (data) {
                  return Expanded(
                    child: PaginatedDataTable(
                      showCheckboxColumn: true,
                      showFirstLastButtons: false,
                      showEmptyRows: false,
                      onPageChanged: (page) {
                        setState(() {
                          _page = page;
                        });
                      },
                      columns: const [
                        DataColumn(
                            label: Text(
                          "ID",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        DataColumn(
                            label: Text(
                          "Username",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        DataColumn(
                            label: Text(
                          "Email",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        DataColumn(
                            label: Text(
                          "Rule",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        DataColumn(
                            label: Text(
                          "Created",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        DataColumn(label: SizedBox.shrink()),
                      ],
                      source: CustomersDataSource(data, context),
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
