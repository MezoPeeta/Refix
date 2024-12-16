import 'dart:io';

import 'package:dashboard/src/core/theme/btns.dart';
import 'package:dashboard/src/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnetimeEditScreen extends StatefulWidget {
  const OnetimeEditScreen({super.key});

  @override
  State<OnetimeEditScreen> createState() => _OnetimeEditScreenState();
}

class _OnetimeEditScreenState extends State<OnetimeEditScreen> {
  File? picture;
  late DropzoneViewController controller;
  final formKey = GlobalKey<FormState>();
  final headingController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 925,
                  height: 587,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    spacing: 24,
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            DropzoneView(
                                onCreated: (ctrl) => controller = ctrl,
                                onDropFile: (file) async {
                                  final a =
                                      await controller.createFileUrl(file);
                                  setState(() {
                                    picture = File(a);
                                  });
                                }),
                            Container(
                                height: 202,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: AppColors.primaryRefix
                                        .withValues(alpha: 0.3),
                                    borderRadius: BorderRadius.circular(16)),
                                child: picture == null
                                    ? Column(
                                        children: [
                                          SvgPicture.asset(
                                            "assets/img/home/up_icon.svg",
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                  "Drag & drop files or"),
                                              TextButton(
                                                child: const Text("Button"),
                                                onPressed: () {},
                                              ),
                                            ],
                                          ),
                                          const Text(
                                              "The image size must be 430 * 681."),
                                        ],
                                      )
                                    : Image.network(
                                        picture?.path ?? "",
                                        width: 80,
                                        fit: BoxFit.cover,
                                      ))
                          ],
                        ),
                      ),
                      TextFormField(
                        controller: headingController,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return "Please enter heading";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(hintText: "Heading"),
                      ),
                      TextFormField(
                        controller: descriptionController,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return "Please enter details";
                          }
                          return null;
                        },
                        maxLines: 5,
                        maxLength: 200,
                        decoration:
                            const InputDecoration(hintText: "The details"),
                      ),
                      PrimaryButton(
                          text: "Save",
                          onPressed: () {
                            if (formKey.currentState!.validate()) {}
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
