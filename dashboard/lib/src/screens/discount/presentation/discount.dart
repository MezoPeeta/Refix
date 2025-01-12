import 'package:dashboard/src/screens/discount/domain/discount_domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../users/domain/source.dart';

class DiscountScreen extends ConsumerStatefulWidget {
  const DiscountScreen({super.key});

  @override
  ConsumerState<DiscountScreen> createState() => _DiscountScreenState();
}

class _DiscountScreenState extends ConsumerState<DiscountScreen> {
  String? query;

  @override
  Widget build(BuildContext context) {
    final discounts = ref.watch(getDiscountsProvider);
    return Scaffold(
        backgroundColor: Colors.white,
        body: discounts.when(
            data: (data) {
              return SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height,
                  child: PaginatedDataTable(
                    columns: const [
                      DataColumn(
                          label: Text(
                        "Page Name",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      DataColumn(
                          label: Text(
                        "Heading (English)",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      DataColumn(
                          label: Text(
                        "Heading (Arabic)",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      DataColumn(
                          label: Text(
                        "Details (English)",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      DataColumn(
                          label: Text(
                        "Details (Arabic)",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      DataColumn(label: SizedBox.shrink()),
                    ],
                    source: DiscountTableSource(data, context),
                  ),
                ),
              );
            },
            error: (e, s) {
              debugPrint("Error: $e");
              return Text("Error: $e,St:$s");
            },
            loading: () => const Center(child: CircularProgressIndicator())));
  }
}
