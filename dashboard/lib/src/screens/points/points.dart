import 'package:dashboard/src/screens/navbar/navbar.dart';
import 'package:dashboard/src/screens/points/domain/points_domain.dart';
import 'package:dashboard/src/screens/users/domain/source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/btns.dart';
import '../base/base.dart';

class PointsScreen extends ConsumerStatefulWidget {
  const PointsScreen({super.key});

  @override
  ConsumerState<PointsScreen> createState() => _PointsScreenState();
}

class _PointsScreenState extends ConsumerState<PointsScreen> {
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
                  Expanded(
                      child: SecondaryButton(
                          text: "Add New +",
                          onPressed: () {
                            ref.read(currentIndexProvider.notifier).state = 9;
                          })),
                ],
              ),
              points.when(
                  data: (data) {
                    return PaginatedDataTable(
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
                    );
                  },
                  error: (e, s) {
                    debugPrint("Points Error: $e");
                    return const Text("Error");
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator())),
            ],
          ),
        ));
  }
}
