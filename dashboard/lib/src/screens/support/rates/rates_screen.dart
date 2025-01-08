import 'package:dashboard/src/screens/support/rates/domain/rates_domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/radii.dart';
import 'domain/rates_source.dart';

class RatesScreen extends ConsumerStatefulWidget {
  const RatesScreen({super.key});

  @override
  ConsumerState<RatesScreen> createState() => _RatesScreenState();
}

class _RatesScreenState extends ConsumerState<RatesScreen> {
  int _page = 1;
  String? query;
  @override
  Widget build(BuildContext context) {
    final points = ref.watch(getRatesProvider(page: _page, query: query));

    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
              points.when(
                  data: (data) {
                    return Expanded(
                      child: PaginatedDataTable(
                        columnSpacing: 95,
                        onPageChanged: (newPage) {
                          setState(() {
                            _page = newPage;
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
                            "Worker Name",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text(
                            "Client Name",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text(
                            "Rating",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text(
                            "Date of order",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text(
                            "Created",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          DataColumn(label: SizedBox.shrink()),
                        ],
                        source: RatesDataSource(data, ref),
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
