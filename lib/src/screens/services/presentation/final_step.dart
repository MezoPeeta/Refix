import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:refix/src/core/ui/theme/colors.dart';
import 'package:refix/src/core/ui/widgets/button.dart';
import 'package:refix/src/screens/services/domain/booking_domain.dart';
import 'package:refix/src/screens/services/domain/location.dart';
import 'package:refix/src/screens/services/presentation/tackphoto.dart';

import '../../../core/ui/theme/radii.dart';
import '../../../core/ui/widgets/header.dart';
import '../../home/data/home_data.dart';
import 'more_services.dart';
import 'services.dart';

final imageProvider = StateProvider<XFile?>((ref) => null);

class FinalstepScreen extends ConsumerStatefulWidget {
  const FinalstepScreen({super.key});

  @override
  ConsumerState<FinalstepScreen> createState() => _FinalstepScreenState();
}

class _FinalstepScreenState extends ConsumerState<FinalstepScreen> {
  static List<XFile> photos = [];
  static Set<Service> addedServices = <Service>{};
  final _key = GlobalKey<FormState>();
  final locationController = TextEditingController();
  final timeController = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final subservices = ref.watch(serviceProvider);
    final a = ref.watch(serviceForPhotoProvider);
    final service = ref.watch(choosenService);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              service?.name ?? "Please enter service name",
              style: const TextStyle(fontSize: AppTextSize.two),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/img/services/progress_fill.svg"),
                const SizedBox(
                  width: 16,
                ),
                SvgPicture.asset("assets/img/services/progress_fill.svg"),
                const SizedBox(
                  width: 16,
                ),
                SvgPicture.asset("assets/img/services/progress_fill.svg")
              ],
            )
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextHeader(
                  text: "Select Service Name",
                  fontWeight: FontWeight.w500,
                ),
                const Text(
                  "If you have any questions, please fill in the input box below.If you have any questions, please fill in the input box below.",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: AppTextSize.one,
                      color: AppColors.neutralRefix),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    a != null
                        ? ServiceContainer(
                            service: a,
                            onPressed: () {},
                          )
                        : const SizedBox.shrink(),
                    const SizedBox(
                      width: 16,
                    ),
                    Wrap(
                        children: addedServices
                            .map((e) =>
                                ServiceContainer(service: e, onPressed: () {}))
                            .toList()),
                    const SizedBox(
                      width: 24,
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      child: GridView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: subservices.length,
                                        gridDelegate:
                                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                                crossAxisSpacing: 24,
                                                mainAxisSpacing: 24,
                                                maxCrossAxisExtent: 116.67),
                                        itemBuilder: (context, index) {
                                          return ServiceContainer(
                                            service: subservices[index],
                                            onPressed: () {},
                                          );
                                        },
                                      ),
                                    ),
                                    PrimaryButton(
                                        text: "Add Services", onPressed: () {})
                                  ],
                                ),
                              );
                            });
                      },
                      child: Container(
                        width: 116.67,
                        height: 101,
                        decoration: BoxDecoration(
                            color: AppColors.neutral100,
                            borderRadius: BorderRadius.circular(AppRadii.lg)),
                        child: SvgPicture.asset(
                          "assets/img/home/add_disabled.svg",
                          width: 39,
                          height: 39,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                const TextHeader(
                  text: "Photo your problem",
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    AddedImage(
                      path: ref.watch(imageProvider)!.path,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 77,
                        height: 80,
                        decoration: BoxDecoration(
                            color: AppColors.neutral100,
                            borderRadius: BorderRadius.circular(AppRadii.lg)),
                        child: SvgPicture.asset(
                          "assets/img/home/add_disabled.svg",
                          width: 39,
                          height: 39,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const TextHeader(
                  text: "Select Service Name",
                  fontWeight: FontWeight.w500,
                ),
                const Text(
                  "If you have any questions, please fill in the input box below.If you have any questions, please fill in the input box below.",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: AppTextSize.one,
                      color: AppColors.neutralRefix),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  readOnly: true,
                  controller: locationController,
                  onTap: () async {
                    final position = await ref
                        .watch(getPlacemarkProvider.future)
                        .catchError((e) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(e)));
                      }
                    });
                    setState(() {
                      locationController.text = position?.street ?? "";
                    });
                  },
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Please add address";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Add Address",
                      suffixIcon: SvgPicture.asset(
                        "assets/img/services/location.svg",
                        width: 11,
                        fit: BoxFit.scaleDown,
                      )),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: timeController,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Please add date";
                    }
                    return null;
                  },
                  onTap: () {
                    showDatePicker(
                            context: context,
                            currentDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate:
                                DateTime.now().add(const Duration(days: 50)))
                        .then((v) {
                      setState(() {
                        timeController.text = DateFormat.yMd().format(v!);
                      });
                    });
                  },
                  readOnly: true,
                  decoration: InputDecoration(
                      hintText: "Pick Date",
                      suffixIcon: SvgPicture.asset(
                        "assets/img/services/calendar.svg",
                        width: 11,
                        fit: BoxFit.scaleDown,
                      )),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  maxLength: 200,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    hintText: "Add Notes Here",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: PrimaryButton(
          text: "Booking Now",
          loading: loading,
          onPressed: () async {
            if (_key.currentState!.validate()) {
              setState(() {
                loading = true;
              });
              final res = await ref.read(addBookingProvider(
                      date: DateTime.parse(timeController.text),
                      services: addedServices.map((e) => e.name).toList())
                  .future);
              res.fold((v) {}, (v) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("Successful")));
              });
              setState(() {
                loading = false;
              });
            }
          },
        ),
      ),
    );
  }
}

class AddedImage extends StatelessWidget {
  const AddedImage({
    super.key,
    required this.path,
  });

  final String path;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          width: 77,
          height: 80,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: FileImage(File(path))),
              borderRadius: BorderRadius.circular(AppRadii.lg)),
        ),
        GestureDetector(
          onTap: () {},
          child: const CircleAvatar(
            backgroundColor: AppColors.white,
            foregroundColor: AppColors.black,
            radius: 10,
            child: Icon(
              Icons.close,
              size: 15,
            ),
          ),
        )
      ],
    );
  }
}
