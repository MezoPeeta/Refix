import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:dashboard/src/core/theme/btns.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../auth/data/auth_data.dart';
import 'domain/source.dart';

class ClientScreen extends ConsumerStatefulWidget {
  const ClientScreen({super.key});

  @override
  ConsumerState<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends ConsumerState<ClientScreen> {
  int _page = 1;
  String? query;
  final TextEditingController _fileNameController =
      TextEditingController(text: 'users');
  String formatTime(DateTime time) {
    final formattedDate = DateFormat.yMd().format(time);
    final formattedTime = DateFormat('jm').format(time);
    return "$formattedTime $formattedDate";
  }

  void saveUserCSV(List<User>? users, String filePath) async {
    List<List<dynamic>> rows = [];

    rows.add(["ID", 'Name', 'Email', 'Phone Number', "Role", "Created At"]);
    if (users != null) {
      for (var user in users) {
        rows.add([
          user.id,
          user.username,
          user.email,
          user.phone,
          user.role.name,
          formatTime(user.createdAt)
        ]);
        String csv = const ListToCsvConverter().convert(rows);
        final bytes = utf8.encode(csv);
        String fileName = _fileNameController.text.trim();
        if (fileName.isEmpty) {
          fileName = 'users';
        }
        await FileSaver.instance.saveFile(
          name: fileName,
          bytes: bytes,
          ext: 'csv',
          mimeType: MimeType.csv,
        );
      }
    }
  }

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
                          text: "Download Users",
                          onPressed: () =>
                              saveUserCSV(customers.value, "users.csv"))),
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
                      ),
                    );
                  },
                  error: (e, s) {
                    debugPrint("Error: $e");
                    return Text("Error:$e,st:$s");
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator())),
            ],
          ),
        ));
  }
}
