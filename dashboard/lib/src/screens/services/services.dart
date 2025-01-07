import 'package:dashboard/src/core/theme/btns.dart';
import 'package:dashboard/src/screens/services/domain/services_domain.dart';
import 'package:dashboard/src/screens/users/domain/users_domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/radii.dart';
import '../users/domain/source.dart';

class ServicesScreen extends ConsumerStatefulWidget {
  const ServicesScreen({super.key});

  @override
  ConsumerState<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends ConsumerState<ServicesScreen> {
  int _page = 1;
  String? query;

  @override
  Widget build(BuildContext context) {
    final services = ref.watch(getServicesProvider(page: _page, query: query));
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                spacing: 16,
                children: [
                  Text(
                    "All (${services.value?.length ?? 0})",
                    style: const TextStyle(
                        fontSize: AppTextSize.three,
                        fontWeight: FontWeight.w500),
                  ),
                  Expanded(
                      child: SecondaryButton(
                          text: "Add New Service",
                          onPressed: () => context.push(
                                "/services/edit",
                              ))),
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
              const SizedBox(
                height: 8,
              ),
              services.when(
                  data: (data) {
                    return Expanded(
                      child: PaginatedDataTable(
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
                            "Image",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text(
                            "Name",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text(
                            "Type",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text(
                            "Price",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text(
                            "Status",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          DataColumn(label: SizedBox.shrink()),
                        ],
                        source: ServicesDataTable(data, context),
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
