import 'package:dashboard/src/core/theme/radii.dart';
import 'package:dashboard/src/screens/users/domain/source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InbookingScreen extends ConsumerStatefulWidget {
  const InbookingScreen({super.key});

  @override
  ConsumerState<InbookingScreen> createState() => _InbookingScreenState();
}

class _InbookingScreenState extends ConsumerState<InbookingScreen> {
  int _page = 1;
  String? query;
  @override
  Widget build(BuildContext context) {
    final bookings = ref.watch(getBookingsProvider(page: _page, query: query));

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
                    "All (${bookings.value?.length ?? 0})",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: AppTextSize.three),
                  ),
                  Expanded(
                    flex: 4,
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
              bookings.when(
                  data: (data) {
                    print("Data is :$data");
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
                            "Service Name",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text(
                            "Customer Name",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text(
                            "Cost",
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
                        source: BookingDataSource(ref, data),
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
          ),
        ));
  }
}
