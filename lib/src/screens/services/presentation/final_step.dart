import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:refix/src/core/localization/domain.dart';
import 'package:refix/src/core/ui/theme/colors.dart';
import 'package:refix/src/core/ui/widgets/button.dart';
import 'package:refix/src/screens/boarding/data/boarding_data.dart';
import 'package:refix/src/screens/points/data/points.dart';
import 'package:refix/src/screens/points/domain/points_domain.dart';
import 'package:refix/src/screens/services/domain/booking_domain.dart';
import 'package:refix/src/screens/services/domain/location.dart';

import '../../../core/ui/theme/radii.dart';
import '../../../core/ui/widgets/header.dart';
import '../../home/data/home_data.dart';
import '../../home/domain/home_domain.dart';
import '../../profile/presentation/payment_methods.dart';
import 'services.dart';

final imageProvider = StateProvider<XFile?>((ref) => null);

class FinalstepScreen extends ConsumerStatefulWidget {
  const FinalstepScreen(
      {super.key,
      required this.service,
      required this.photo,
      required this.type});

  final String service;
  final String photo;
  final String type;

  @override
  ConsumerState<FinalstepScreen> createState() => _FinalstepScreenState();
}

class _FinalstepScreenState extends ConsumerState<FinalstepScreen> {
  final _key = GlobalKey<FormState>();
  final locationController = TextEditingController();
  final timeController = TextEditingController();
  final notesController = TextEditingController();

  bool loading = false;
  DateTime? dateTime;
  List<String> photos = [];
  List<Service> addedServices = [];

  @override
  Widget build(BuildContext context) {
    final service = Service.fromJson(jsonDecode(widget.service));
    List<String> capturedPhotos = [widget.photo, ...photos];
    List<Service> allServices = [service, ...addedServices];
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              service.name.localized,
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
                TextHeader(
                  text: context.tr.selectServiceName,
                  fontWeight: FontWeight.w500,
                ),
                Text(
                  context.tr.addMoreServices,
                  style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: AppTextSize.one,
                      color: AppColors.neutralRefix),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 110,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  width: 10,
                                ),
                            itemCount: allServices.length + 1,
                            itemBuilder: (context, index) {
                              if (index == allServices.length) {
                                return GestureDetector(
                                  onTap: () {
                                    final services = ref
                                            .watch(getSubServicesProvider(
                                                type: widget.type))
                                            .value ??
                                        [];
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: services.isNotEmpty
                                                ? Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SizedBox(
                                                        child: GridView.builder(
                                                          shrinkWrap: true,
                                                          physics:
                                                              const NeverScrollableScrollPhysics(),
                                                          itemCount:
                                                              services.length,
                                                          gridDelegate:
                                                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                                                  crossAxisSpacing:
                                                                      24,
                                                                  mainAxisSpacing:
                                                                      24,
                                                                  maxCrossAxisExtent:
                                                                      116.67),
                                                          itemBuilder:
                                                              (context, index) {
                                                            return ServiceContainer(
                                                              service: services[
                                                                  index],
                                                              onPressed: () {
                                                                setState(() {
                                                                  addedServices.add(
                                                                      services[
                                                                          index]);
                                                                });
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      PrimaryButton(
                                                          text: "Add Services",
                                                          onPressed: () {
                                                            context.pop();
                                                          })
                                                    ],
                                                  )
                                                : const Center(
                                                    child: Text(
                                                        "No other subservice at the moment"),
                                                  ),
                                          );
                                        });
                                  },
                                  child: Container(
                                    width: 116.67,
                                    height: 101,
                                    decoration: BoxDecoration(
                                        color: AppColors.neutral100,
                                        borderRadius:
                                            BorderRadius.circular(AppRadii.lg)),
                                    child: SvgPicture.asset(
                                      "assets/img/home/add_disabled.svg",
                                      width: 39,
                                      height: 39,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                );
                              }
                              return GestureDetector(
                                onDoubleTap: () {
                                  setState(() {
                                    addedServices.removeAt(index - 1);
                                  });
                                },
                                child: ServiceContainer(
                                  service: allServices[index],
                                  isSelected: true,
                                  onPressed: () {},
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                TextHeader(
                  text: context.tr.photoYourProblem,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 80,
                        child: ListView.separated(
                            itemCount: capturedPhotos.length + 1,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  width: 16,
                                ),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              if (index == capturedPhotos.length) {
                                return GestureDetector(
                                  onTap: () async {
                                    if (photos.length > 2) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  "You can only add 4 photos")));
                                      return;
                                    }
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
                                      "assets/img/home/add_disabled.svg",
                                      width: 39,
                                      height: 39,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                );
                              }
                              return AddedImage(
                                path: capturedPhotos[index],
                                onRemove: () {
                                  setState(() {
                                    photos.removeAt(index - 1);
                                  });
                                },
                              );
                            }),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                TextHeader(
                  text: context.tr.selectServiceName,
                  fontWeight: FontWeight.w500,
                ),
                Text(
                  context.tr.fillInputBox,
                  style: const TextStyle(
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
                    ref.read(updateLatLongProvider);
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
                      return context.tr.pleaseAddAddress;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: context.tr.addAddress,
                      fillColor: Colors.white,
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
                      return context.tr.pleaseAddDate;
                    }
                    return null;
                  },
                  onTap: () {
                    showDatePicker(
                            context: context,
                            currentDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            initialDate: DateTime.now(),
                            lastDate:
                                DateTime.now().add(const Duration(days: 50)))
                        .then((v) {
                      setState(() {
                        timeController.text = DateFormat.yMd().format(v!);
                        dateTime = v;
                      });
                    });
                  },
                  readOnly: true,
                  decoration: InputDecoration(
                      hintText: context.tr.pickDate,
                      fillColor: Colors.white,
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
                  controller: notesController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintText: context.tr.add_notes,
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
          text: context.tr.bookNow,
          loading: loading,
          onPressed: () async {
            final addedServicesID = allServices.map((e) => e.id).toList();
            if (_key.currentState!.validate()) {
              setState(() {
                loading = true;
              });

              try {
                final bookingID = await ref.read(addBookingProvider(
                  images: capturedPhotos,
                  date: dateTime!,
                  notes: notesController.text,
                  services: addedServicesID,
                ).future);

                ref.read(bookingIDProvider.notifier).state = bookingID;

                if (!context.mounted) return;

                final results = await Future.wait([
                  ref.read(
                      getDiscountProvider(pageName: "Booking Done").future),
                  ref.read(getCustomerOfferProvider.future),
                ]);

                final discount = results[0] as Discount?;
                final offer = results[1] as Offer?;

                if (mounted) {
                  setState(() {
                    loading = false;
                  });
                }

                if (discount != null && offer != null) {
                  if (discount.active == true || offer.isUsed == false) {
                    return context.goNamed(
                      "BookingDone",
                      extra: discount,
                      pathParameters: {
                        "cost": service.price.toString(),
                        "points": offer.point.percentage.toString(),
                      },
                    );
                  }
                }
                context.go("/payment_method");
              } catch (e) {
                if (mounted) {
                  setState(() {
                    loading = false;
                  });
                }
              }
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
    required this.onRemove,
    this.isFile = true,
  });

  final String path;
  final bool isFile;
  final VoidCallback onRemove;

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
                  fit: BoxFit.cover,
                  image: isFile ? FileImage(File(path)) : NetworkImage(path)),
              borderRadius: BorderRadius.circular(AppRadii.lg)),
        ),
        GestureDetector(
          onTap: onRemove,
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
