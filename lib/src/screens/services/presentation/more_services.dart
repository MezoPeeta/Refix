import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:refix/src/core/localization/domain.dart';
import 'package:refix/src/core/ui/theme/colors.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/core/ui/widgets/button.dart';
import 'package:refix/src/core/ui/widgets/header.dart';
import 'package:refix/src/screens/home/data/home_data.dart';
import 'package:refix/src/screens/services/presentation/services.dart';

import 'tackphoto.dart';

// final serviceProvider = StateProvider<List<Service>>((ref) => []);
final choosenService = StateProvider<Service?>((ref) => null);

class MoreServicesScreen extends ConsumerStatefulWidget {
  const MoreServicesScreen(
      {super.key, required this.services, required this.name});
  final List<Service> services;
  final String name;

  @override
  ConsumerState<MoreServicesScreen> createState() => _MoreServicesScreenState();
}

class _MoreServicesScreenState extends ConsumerState<MoreServicesScreen> {
  bool isOther = false;
  final otherService = const Service(
      name: "Other",
      details: "details",
      id: "id",
      price: 0,
      isActive: false,
      childService: [],
      image: "image",
      v: 0);
  int? selectedServiceIndex;
  Service? selectedService;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              widget.name ?? "Please enter service name",
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
                SvgPicture.asset("assets/img/services/progress.svg"),
                const SizedBox(
                  width: 16,
                ),
                SvgPicture.asset("assets/img/services/progress.svg")
              ],
            )
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              const SizedBox(height: 24),
              Column(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.services.length + 1,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            crossAxisSpacing: 24,
                            mainAxisSpacing: 24,
                            maxCrossAxisExtent: 116.67),
                    itemBuilder: (context, index) {
                      if (index == widget.services.length) {
                        return ServiceContainer(
                            isSelected: index == selectedServiceIndex,
                            onPressed: () {
                              setState(() {
                                selectedServiceIndex = index;
                              });
                              ref.read(serviceForPhotoProvider.notifier).state =
                                  otherService;
                            },
                            service: otherService);
                      }
                      return ServiceContainer(
                        service: widget.services[index],
                        isSelected: index == selectedServiceIndex,
                        onPressed: () {
                          setState(() {
                            selectedServiceIndex = index;
                            selectedService = widget.services[index];
                          });
                          // ref.read(serviceForPhotoProvider.notifier).state =
                          //     widget.services[index];
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Visibility(
                    visible: selectedServiceIndex == widget.services.length,
                    child: TextFormField(
                      maxLength: 200,
                      decoration: InputDecoration(
                          filled: true, hintText: context.tr.add_notes),
                      maxLines: 5,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: PrimaryButton(
          text: context.tr.next,
          onPressed: () {
            if (selectedService != null) {
              context.push(
                "/tack_photo",
                extra: selectedService,
              );
              return;
            }
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(context.tr.choose_service)));
          },
        ),
      ),
    );
  }
}
