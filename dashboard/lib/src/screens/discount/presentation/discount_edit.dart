import 'package:dashboard/src/app.dart';
import 'package:dashboard/src/screens/content/data/boarding_data.dart';
import 'package:dashboard/src/screens/discount/domain/discount_domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/btns.dart';
import '../data/discount_data.dart';

class DiscountEdit extends StatefulWidget {
  const DiscountEdit({super.key, required this.discount});

  final Discount discount;

  @override
  State<DiscountEdit> createState() => _DiscountEditState();
}

class _DiscountEditState extends State<DiscountEdit> {
  final headingController = TextEditingController();

  final headingARController = TextEditingController();
  final detailsController = TextEditingController();
  final detailsARController = TextEditingController();
  final discountController = TextEditingController();

  static final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool isActive = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      headingController.text = widget.discount.heading?.en ?? "-";
      headingARController.text = widget.discount.heading?.ar ?? "-";
      detailsController.text = widget.discount.details?.en ?? "-";
      detailsARController.text = widget.discount.details?.ar ?? "-";
      discountController.text = widget.discount.discount.toString();
      isActive = widget.discount.active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 16,
              children: [
                const Text(
                  "Edit Discount",
                ),
                TextFormField(
                  controller: headingController,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Please add heading";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      hintText: "Heading(EN)", label: Text("Heading(EN)")),
                ),
                TextFormField(
                  controller: headingARController,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Please add heading in arabic";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Heading(AR)",
                    label: Text("Heading(AR)"),
                  ),
                ),
                TextFormField(
                  controller: detailsController,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Please add details";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      label: Text("Details(EN)"), hintText: "Details(EN)"),
                ),
                TextFormField(
                  controller: detailsARController,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Please add details in arabic";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      label: Text("Details(AR)"), hintText: "Details(AR)"),
                ),
                TextFormField(
                  controller: discountController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                  ],
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Please add discount";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      label: Text("Discount"), hintText: "Discount"),
                ),
                DropdownButtonFormField(
                    value: isActive,
                    items: const [
                      DropdownMenuItem(
                        value: true,
                        child: Text("Active"),
                      ),
                      DropdownMenuItem(
                        value: false,
                        child: Text("InActive"),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        isActive = value!;
                      });
                    }),
                Consumer(builder: (context, ref, child) {
                  return PrimaryButton(
                      text: "Edit Discount",
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          final result = await ref.read(updateDiscountProvider(
                                  discount: widget.discount.copyWith(
                                      active: isActive,
                                      discount: double.tryParse(
                                          discountController.text),
                                      heading: Localized(
                                          en: headingController.text,
                                          ar: headingARController.text),
                                      details: Localized(
                                          en: detailsController.text,
                                          ar: detailsARController.text)))
                              .future);
                          if (result != null) {
                            ref
                                .read(scaffoldMessengerPod)
                                .showSnackBar(SnackBar(content: Text(result)));
                            context.pop();
                          }
                          setState(() {
                            loading = false;
                          });
                        }
                      },
                      loading: loading);
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
