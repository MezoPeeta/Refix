import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth/data/auth_data.dart';
import 'domain/source.dart';

class ClientScreen extends ConsumerWidget {
  const ClientScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(getUsersProvider);
    return Scaffold(
        body: users.when(
            data: (data) {
              return PaginatedDataTable(
                  showEmptyRows: false,
                  columnSpacing: 100,
                  rowsPerPage: 10,
                  onPageChanged: (value) {
                    print(value);
                  },
                  showCheckboxColumn: true,
                  columns: const [
                    DataColumn2(label: Text("ID")),
                    DataColumn2(label: Text("Username")),
                    DataColumn2(label: Text("Email")),
                  ],
                  source: UsersDataSource(data));
            },
            error: (e, s) {
              debugPrint("Error: $e");
              return const Text("Error");
            },
            loading: () => const Center(child: CircularProgressIndicator())));
  }
}
