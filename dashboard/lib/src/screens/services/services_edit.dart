import 'package:dashboard/src/core/theme/colors.dart';
import 'package:dashboard/src/screens/booking/data/booking.dart';
import 'package:dashboard/src/screens/content/data/boarding_data.dart';
import 'package:dashboard/src/screens/services/domain/services_domain.dart';
import 'package:dashboard/src/screens/users/domain/users_domain.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app.dart';
import '../../core/theme/btns.dart';
import '../auth/data/auth_data.dart';

class AddEditService extends ConsumerStatefulWidget {
  const AddEditService({super.key, required this.service});
  final Service? service;

  @override
  ConsumerState<AddEditService> createState() => _AddEditServiceState();
}

class _AddEditServiceState extends ConsumerState<AddEditService> {
  final nameController = TextEditingController();
  final nameArController = TextEditingController();
  final detailsController = TextEditingController();
  final detailsArController = TextEditingController();

  static final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool isEditting = false;
  Uint8List? picture;
  late DropzoneViewController controller;
  String? selectedType;

  final priceController = TextEditingController();

  bool isActive = false;

  @override
  void initState() {
    super.initState();
    if (widget.service != null) {
      setState(() {
        isEditting = true;
        nameController.text = widget.service!.name!.en;
        nameArController.text = widget.service!.name!.ar;
        detailsController.text = widget.service!.details!.en;
        detailsArController.text = widget.service!.details!.ar;
        selectedType = widget.service!.type;
        isActive = widget.service!.isActive;
        priceController.text = widget.service!.price.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final types = ref.watch(getServicesTypesProvider);
    return Scaffold(
      appBar: AppBar(),
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
                  Text(
                    isEditting ? "Edit Service" : "Add Service",
                  ),
                  TextFormField(
                    controller: nameController,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Please add Service Name";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(hintText: "Service Name"),
                  ),
                  TextFormField(
                    controller: nameArController,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Please add Service Name";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: "Service Name (Arabic)"),
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
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: 250,
                    child: Stack(
                      children: [
                        DropzoneView(
                            onCreated: (ctrl) => controller = ctrl,
                            onDropFile: (file) async {
                              final a = await controller.getFileData(file);
                              setState(() {
                                picture = a;
                              });
                            }),
                        Container(
                          height: 250,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color:
                                  AppColors.primaryRefix.withValues(alpha: 0.3),
                              borderRadius: BorderRadius.circular(16)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              picture == null
                                  ? SvgPicture.asset(
                                      "assets/img/home/up_icon.svg",
                                    )
                                  : Image.memory(
                                      picture!,
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.cover,
                                    ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Drag & drop files or"),
                                  TextButton(
                                    child: const Text("Upload Image"),
                                    onPressed: () async {
                                      FilePickerResult? result =
                                          await FilePicker.platform
                                              .pickFiles(type: FileType.image);
                                      if (result != null) {
                                        final file = result.files.single.bytes;

                                        setState(() {
                                          picture = file;
                                        });
                                      }
                                    },
                                  ),
                                ],
                              ),
                              const Text("The image size must be 430 * 681."),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
                    controller: detailsArController,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Please add details in arabic";
                      }
                      return null;
                    },
                    maxLength: 200,
                    maxLines: 5,
                    decoration:
                        const InputDecoration(hintText: "Details (arabic)"),
                  ),
                  types.when(
                      data: (data) {
                        return DropdownButtonFormField(
                          value: selectedType,
                          decoration:
                              const InputDecoration(hintText: "Pick Type"),
                          items: data
                              .map((e) =>
                                  DropdownMenuItem(value: e, child: Text(e)))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedType = value.toString();
                            });
                          },
                        );
                      },
                      error: (e, s) => Text("Error: $e"),
                      loading: () => const CircularProgressIndicator()),
                  TextFormField(
                    controller: priceController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                    ],
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Please add Price";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        label: Text("Price"), hintText: "Price"),
                  ),
                  PrimaryButton(
                      text: isEditting ? "Edit Service" : "Add Service",
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });

                          if (isEditting) {
                            final service = widget.service!.copyWith(
                                price: int.parse(priceController.text),
                                details: Localized(
                                    en: detailsController.text,
                                    ar: detailsArController.text),
                                type: selectedType,
                                isActive: isActive,
                                name: Localized(
                                    en: nameController.text,
                                    ar: nameArController.text));

                            final result = await ref.read(updateServiceProvider(
                                    service: service, image: picture!)
                                .future);
                            ref
                                .read(scaffoldMessengerPod)
                                .showSnackBar(SnackBar(content: Text(result)));
                            return;
                          }
                          if (picture == null) {
                            ref.read(scaffoldMessengerPod).showSnackBar(
                                const SnackBar(
                                    content: Text("Please add a photo")));
                            setState(() {
                              loading = false;
                            });
                            return;
                          }
                          final service = Service(
                              price: int.parse(priceController.text),
                              id: "",
                              image: "",
                              details: Localized(
                                  en: detailsController.text,
                                  ar: detailsArController.text),
                              type: selectedType,
                              isActive: isActive,
                              name: Localized(
                                  en: nameController.text,
                                  ar: nameArController.text));

                          final result = await ref.read(createServiceProvider(
                                  service: service, image: picture!)
                              .future);
                          ref
                              .read(scaffoldMessengerPod)
                              .showSnackBar(SnackBar(content: Text(result)));
                          setState(() {
                            loading = false;
                          });
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
