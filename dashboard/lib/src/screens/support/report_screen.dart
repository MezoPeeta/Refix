import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/radii.dart';
import '../points/domain/points_domain.dart';
import '../users/domain/source.dart';

class ReportsScreen extends ConsumerStatefulWidget {
  const ReportsScreen({super.key});

  @override
  ConsumerState<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends ConsumerState<ReportsScreen> {
  @override
  Widget build(BuildContext context) {
    final points = ref.watch(getPointsProvider);

    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                spacing: 20,
                children: [
                  Text(
                    "All (${points.value?.length ?? 0})",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: AppTextSize.three),
                  ),
                  Expanded(
                    flex: 4,
                    child: TextField(
                      onChanged: (value) {},
                      decoration: const InputDecoration(
                          filled: true, hintText: "Search Here"),
                    ),
                  )
                ],
              ),
              points.when(
                  data: (data) {
                    return Expanded(
                      child: PaginatedDataTable(
                        columnSpacing: 95,
                        columns: const [
                          DataColumn(
                              label: Text(
                            "ID",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text(
                            "Package Name",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text(
                            "Offer",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text(
                            "Available Number of Days",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text(
                            "Points",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text(
                            "Created",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text(
                            "Status",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          DataColumn(label: SizedBox.shrink()),
                        ],
                        source: PointsDataSource(data, ref),
                      ),
                    );
                  },
                  error: (e, s) {
                    return Text("Error: $e,str:$s");
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator())),
            ],
          ),
        ));
  }
}
