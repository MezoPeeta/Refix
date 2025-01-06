import 'package:dashboard/src/core/theme/btns.dart';
import 'package:dashboard/src/core/theme/radii.dart';
import 'package:dashboard/src/screens/rules/domain/rules_domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../users/domain/source.dart';

class RulesScreen extends ConsumerStatefulWidget {
  const RulesScreen({super.key});

  @override
  ConsumerState<RulesScreen> createState() => _RulesScreenState();
}

class _RulesScreenState extends ConsumerState<RulesScreen> {
  @override
  Widget build(BuildContext context) {
    final rules = ref.watch(roleNotifierProvider);
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
                          text: "Add New Role",
                          onPressed: () {
                            context.push("/rule/edit");
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
                          "ID",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        DataColumn(
                            label: Text(
                          "Name",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        DataColumn(label: SizedBox.shrink()),
                      ],
                      source: RuleDataSource(data, context),
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
