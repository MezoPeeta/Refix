import 'package:dashboard/src/app.dart';
import 'package:dashboard/src/core/theme/btns.dart';
import 'package:dashboard/src/core/theme/colors.dart';
import 'package:dashboard/src/screens/content/data/boarding_data.dart';
import 'package:dashboard/src/screens/content/domain/onetime_domain.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../base/base.dart';

final boardingInfoProvider = StateProvider<BoardingUpdate?>((ref) => null);

class OnetimeEditScreen extends ConsumerStatefulWidget {
  const OnetimeEditScreen({super.key});

  @override
  ConsumerState<OnetimeEditScreen> createState() => _OnetimeEditScreenState();
}

class _OnetimeEditScreenState extends ConsumerState<OnetimeEditScreen> {
  Uint8List? picture;
  late DropzoneViewController controller;
  final formKey = GlobalKey<FormState>();
  final headingController = TextEditingController();
  final headingArController = TextEditingController();
  final descriptionController = TextEditingController();
  final descriptionArController = TextEditingController();
  bool loading = false;
  @override
  void initState() {
    super.initState();
    final data = ref.read(boardingInfoProvider);
    if (data != null) {
      headingArController.text = data.headingEn;
      headingController.text = data.headingAr;
      descriptionArController.text = data.detailsAr;
      descriptionController.text = data.detailsEn;
      setState(() {
        picture = data.image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PrevButton(),
                Center(
                  child: Container(
                    width: 925,
                    height: 820,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 24,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              DropzoneView(
                                  onCreated: (ctrl) => controller = ctrl,
                                  onDropFile: (file) async {
                                    final a =
                                        await controller.getFileData(file);
                                    setState(() {
                                      picture = a;
                                    });
                                  }),
                              Container(
                                  height: 222,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: AppColors.primaryRefix
                                          .withValues(alpha: 0.3),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text("Drag & drop files or"),
                                          TextButton(
                                            child: const Text("Upload Image"),
                                            onPressed: () async {
                                              FilePickerResult? result =
                                                  await FilePicker.platform
                                                      .pickFiles(
                                                          type: FileType.image);
                                              if (result != null) {
                                                final file =
                                                    result.files.single.bytes;

                                                setState(() {
                                                  picture = file;
                                                });
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                      const Text(
                                          "The image size must be 430 * 681."),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                        TextFormField(
                          controller: headingController,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Please enter heading in english";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              hintText: "Heading (English)"),
                        ),
                        TextFormField(
                          controller: headingArController,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Please enter heading in arabic";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              hintText: "Heading (Arabic)"),
                        ),
                        TextFormField(
                          controller: descriptionController,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Please enter details in english";
                            }
                            return null;
                          },
                          maxLines: 5,
                          maxLength: 200,
                          decoration: const InputDecoration(
                              hintText: "The details (English)"),
                        ),
                        TextFormField(
                          controller: descriptionArController,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Please enter details in arabic";
                            }
                            return null;
                          },
                          maxLines: 5,
                          maxLength: 200,
                          decoration: const InputDecoration(
                              hintText: "The details (Arabic)"),
                        ),
                        Consumer(builder: (context, ref, child) {
                          return PrimaryButton(
                              loading: loading,
                              text: "Save",
                              onPressed: () async {
                                if (formKey.currentState!.validate() &&
                                    picture != null) {
                                  setState(() {
                                    loading = true;
                                  });
                                  final info = ref.read(boardingInfoProvider);

                                  final res = await ref.read(
                                      updateBoardingProvider(
                                              detailsAr:
                                                  descriptionArController.text,
                                              detailsEn:
                                                  descriptionController.text,
                                              headingAr:
                                                  headingArController.text,
                                              headingEn: headingController.text,
                                              image: picture!,
                                              id: info!.id)
                                          .future);
                                  setState(() {
                                    loading = false;
                                  });
                                  res.fold((v) {
                                    ref.read(scaffoldMessengerPod).showSnackBar(
                                        SnackBar(content: Text(v)));
                                  }, (v) {
                                    ref.read(scaffoldMessengerPod).showSnackBar(
                                        SnackBar(content: Text(v)));
                                  });
                                  return;
                                }
                              });
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
