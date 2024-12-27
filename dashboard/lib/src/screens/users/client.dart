import 'package:dashboard/src/core/theme/btns.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'domain/source.dart';

class ClientScreen extends ConsumerStatefulWidget {
  const ClientScreen({super.key});

  @override
  ConsumerState<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends ConsumerState<ClientScreen> {
  int _page = 1;
  String? query;

  @override
  Widget build(BuildContext context) {
    final customers =
        ref.watch(getCustomersProvider(page: _page, query: query));
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                spacing: 16,
                children: [
                  Expanded(
                      child: SecondaryButton(
                          text: "Add New +",
                          onPressed: () => context.push("/user/edit"))),
                  Expanded(
                      child: SecondaryButton(
                          text: "Download User", onPressed: () {})),
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
              customers.when(
                  data: (data) {
                    return PaginatedDataTable(
                      showCheckboxColumn: true,
                      showFirstLastButtons: false,
                      columnSpacing: 10,
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
                          "Phone Number",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        DataColumn(
                            label: Text(
                          "Created",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        DataColumn(label: SizedBox.shrink()),
                      ],
                      source: UsersDataSource(data, context),
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
