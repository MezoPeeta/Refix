import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:worker/src/app.dart';
import 'package:worker/src/screens/tasks/domain/tasks_domain.dart';

import '../../core/theme/colors.dart';
import '../../core/theme/radii.dart';
import '../../core/widgets/btns.dart';
import '../auth/data/auth_data.dart';

class InspectionScreen extends StatefulWidget {
  const InspectionScreen({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  State<InspectionScreen> createState() => _InspectionScreenState();
}

class _InspectionScreenState extends State<InspectionScreen> {
  List<String> photos = [];
  final notesController = TextEditingController();
  final _key = GlobalKey<FormState>();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final Service service = widget.data["service"];
    final Tasks task = widget.data["task"];

    return Scaffold(
      backgroundColor: AppColors.neutral50,
      appBar: AppBar(
        title: Text(service.name?.localized ?? "Unnamed"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              SvgPicture.asset("assets/img/stepper_2.svg"),
              TextHeader(
                text: "Photos after repair",
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 80,
                child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: photos.length + 1,
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 16,
                        ),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      if (photos.length == index) {
                        return GestureDetector(
                          onTap: () async {
                            final ImagePicker picker = ImagePicker();
                            final XFile? photo = await picker.pickImage(
                                source: ImageSource.camera);
                            if (photo != null) {
                              setState(() {
                                photos.add(photo.path);
                              });
                            }
                          },
                          child: Container(
                            width: 77,
                            height: 80,
                            decoration: BoxDecoration(
                                color: AppColors.neutral100,
                                borderRadius:
                                    BorderRadius.circular(AppRadii.lg)),
                            child: SvgPicture.asset(
                              "assets/img/add.svg",
                              width: 39,
                              height: 39,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        );
                      }
                      return AddedImage(
                        path: photos[index],
                      );
                    }),
              ),
              Form(
                key: _key,
                child: TextFormField(
                  controller: notesController,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Please enter description";
                    }
                    return null;
                  },
                  maxLines: 5,
                  maxLength: 200,
                  decoration: const InputDecoration(
                      hintText: "Description of the problem"),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Consumer(builder: (context, ref, child) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: PrimaryButton(
              loading: loading,
              text: "Finish Work",
              onPressed: () async {
                if (_key.currentState!.validate()) {
                  setState(() {
                    loading = true;
                  });
                  final result = await ref.read(updateBookingProvider(
                          id: task.id,
                          status: "CLOSED",
                          description: notesController.text,
                          images: photos)
                      .future);

                  ref
                      .read(scaffoldMessengerPod)
                      .showSnackBar(SnackBar(content: Text(result)));
                  setState(() {
                    loading = false;
                  });
                  if (result != "Error occured") {
                    if (!context.mounted) return;

                    context.push("/payment",
                        extra: {"service": service, "task": task});
                  }
                }
              }),
        );
      }),
    );
  }
}
