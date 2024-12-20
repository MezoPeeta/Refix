import 'package:dashboard/src/screens/ads/domain/ads_domain.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app.dart';
import '../../core/theme/btns.dart';
import '../../core/theme/colors.dart';
import '../base/base.dart';

final adInfoProvider =
    StateProvider<({String id, String type, Uint8List? image})>((ref) {
  return (id: "", type: "", image: null);
});

class AdsEditScreen extends ConsumerStatefulWidget {
  const AdsEditScreen({super.key});

  @override
  ConsumerState<AdsEditScreen> createState() => _AdsEditScreenState();
}

class _AdsEditScreenState extends ConsumerState<AdsEditScreen> {
  Uint8List? picture;
  late DropzoneViewController controller;
  bool loading = false;
  @override
  void initState() {
    super.initState();
    final data = ref.read(adInfoProvider);
    setState(() {
      picture = data.image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PrevButton(),
              Center(
                child: Container(
                  width: 925,
                  height: 300,
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
                                  final a = await controller.getFileData(file);
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
                                child: picture == null
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                                child:
                                                    const Text("Upload Image"),
                                                onPressed: () async {
                                                  FilePickerResult? result =
                                                      await FilePicker.platform
                                                          .pickFiles(
                                                              type: FileType
                                                                  .image);
                                                  if (result != null) {
                                                    final file = result
                                                        .files.single.bytes;

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
                                      )
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.memory(
                                            picture!,
                                            width: 100,
                                            fit: BoxFit.cover,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
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
                                      ))
                          ],
                        ),
                      ),
                      Consumer(builder: (context, ref, child) {
                        return PrimaryButton(
                            text: "Save",
                            loading: loading,
                            onPressed: () async {
                              final info = ref.read(adInfoProvider);
                              if (picture != null) {
                                setState(() {
                                  loading = true;
                                });
                                final res = await ref
                                    .read(updateAdsByIdProvider(
                                            id: info.id,
                                            image: picture!,
                                            type: info.type)
                                        .future)
                                    .onError((e, s) {
                                  ref.read(scaffoldMessengerPod).showSnackBar(
                                      SnackBar(content: Text(e.toString())));
                                  return null;
                                });
                                setState(() {
                                  loading = false;
                                });
                                ref.read(scaffoldMessengerPod).showSnackBar(
                                    SnackBar(content: Text(res!)));
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
    );
  }
}
