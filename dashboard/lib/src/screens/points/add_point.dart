import 'package:dashboard/src/core/theme/btns.dart';
import 'package:dashboard/src/screens/points/data/point.dart';
import 'package:dashboard/src/screens/points/domain/points_domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app.dart';
import '../base/base.dart';

final pointIDProvider = StateProvider<Point?>((ref) => null);

class AddEditPoints extends ConsumerStatefulWidget {
  const AddEditPoints({super.key});

  @override
  ConsumerState<AddEditPoints> createState() => _AddEditPointsState();
}

class _AddEditPointsState extends ConsumerState<AddEditPoints> {
  final nameController = TextEditingController();
  final nameArabicController = TextEditingController();

  final offerController = TextEditingController();
  final detailsController = TextEditingController();
  final detailsArabicController = TextEditingController();

  final dateController = TextEditingController();
  final pointsController = TextEditingController();
  static final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool isEditting = false;
  bool isActive = true;

  @override
  void initState() {
    super.initState();
    final post = ref.read(pointIDProvider);
    if (post != null) {
      setState(() {
        isEditting = true;
        nameController.text = post.name.en;
        nameArabicController.text = post.name.ar;
        detailsController.text = post.details?.en ?? "";
        detailsArabicController.text = post.details?.ar ?? "";
        isActive = post.active;

        offerController.text = post.percentage.toString();
        dateController.text = post.availableDays.toString();
        pointsController.text = post.availableDays.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                spacing: 16,
                children: [
                  const PrevButton(),
                  const Text(
                    "Add New Points",
                  ),
                  TextFormField(
                    controller: nameController,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Please Add package name in english";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: "Package Name (English)"),
                  ),
                  TextFormField(
                    controller: nameArabicController,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Please Add package name arabic";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: "Package Name (Arabic)"),
                  ),
                  TextFormField(
                    controller: offerController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                    ],
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Please add offer";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(hintText: "Offer"),
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
                  TextFormField(
                    controller: detailsController,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Please add details in english";
                      }
                      return null;
                    },
                    maxLength: 200,
                    maxLines: 5,
                    decoration:
                        const InputDecoration(hintText: "Details (English)"),
                  ),
                  TextFormField(
                    controller: detailsArabicController,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Please add details in arabic";
                      }
                      return null;
                    },
                    maxLength: 200,
                    maxLines: 5,
                    decoration:
                        const InputDecoration(hintText: "Details (Arabic)"),
                  ),
                  TextFormField(
                    readOnly: true,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Please days";
                      }
                      return null;
                    },
                    onTap: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate:
                                  DateTime.now().add(const Duration(days: 30)))
                          .then((selectedDate) {
                        if (selectedDate != null) {
                          final nowDate = DateTime.now();
                          final remainingDays =
                              selectedDate.difference(nowDate).inDays;
                          setState(() {
                            dateController.text = remainingDays.toString();
                          });
                        }
                      });
                    },
                    controller: dateController,
                    decoration: const InputDecoration(
                        hintText: "Number of available days"),
                  ),
                  TextFormField(
                    controller: pointsController,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Please add points";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                    ],
                    decoration: const InputDecoration(hintText: "Points"),
                  ),
                  PrimaryButton(
                      text: isEditting ? "Edit" : "Add",
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          if (isEditting) {
                            final status = await ref
                                .read(updatePointProvider(
                                        id: ref.read(pointIDProvider)!.id,
                                        days: int.parse(dateController.text),
                                        detailsAr: detailsArabicController.text,
                                        detailsEn: detailsController.text,
                                        nameAr: nameArabicController.text,
                                        nameEn: nameController.text,
                                        offers: int.parse(offerController.text),
                                        isActive: isActive,
                                        points:
                                            int.parse(pointsController.text))
                                    .future)
                                .catchError((e) {
                              ref
                                  .read(scaffoldMessengerPod)
                                  .showSnackBar(SnackBar(content: Text(e)));
                            });
                            setState(() {
                              loading = false;
                            });
                            ref
                                .read(scaffoldMessengerPod)
                                .showSnackBar(SnackBar(content: Text(status!)));
                            ref.invalidate(getPointsProvider);
                            context.pop();

                            return;
                          }

                          final status = await ref
                              .read(addPointsProvider(
                                      days: int.parse(dateController.text),
                                      detailsAr: detailsArabicController.text,
                                      detailsEn: detailsController.text,
                                      nameAr: nameArabicController.text,
                                      nameEn: nameController.text,
                                      isActive: isActive,
                                      offers:
                                          int.tryParse(offerController.text)!,
                                      points:
                                          int.tryParse(pointsController.text)!)
                                  .future)
                              .catchError((e) {
                            ref
                                .read(scaffoldMessengerPod)
                                .showSnackBar(SnackBar(content: Text(e)));
                          });

                          setState(() {
                            loading = false;
                          });
                          ref.invalidate(getPointsProvider);
                          context.pop();
                          ref
                              .read(scaffoldMessengerPod)
                              .showSnackBar(SnackBar(content: Text(status!)));
                        }
                      },
                      loading: loading)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
