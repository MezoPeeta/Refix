import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:refix/src/core/ui/theme/colors.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/core/ui/widgets/button.dart';
import 'package:refix/src/core/ui/widgets/header.dart';
import 'package:refix/src/screens/home/data/home_data.dart';
import 'package:refix/src/screens/services/presentation/services.dart';

import 'tackphoto.dart';

final serviceProvider = StateProvider<List<Service>>((ref) => []);
final choosenService = StateProvider<Service?>((ref) => null);

class MoreServicesScreen extends ConsumerStatefulWidget {
  const MoreServicesScreen({super.key});

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
  @override
  Widget build(BuildContext context) {
    final subServices = ref.watch(serviceProvider);
    final service = ref.watch(choosenService);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: SingleChildScrollView(
          child: Column(
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
                  SvgPicture.asset("assets/img/services/progress.svg"),
                  const SizedBox(
                    width: 16,
                  ),
                  SvgPicture.asset("assets/img/services/progress.svg")
                ],
              )
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
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
            Column(
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: subServices.length + 1,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                      maxCrossAxisExtent: 116.67),
                  itemBuilder: (context, index) {
                    if (index == subServices.length) {
                      return ServiceContainer(
                          onPressed: () {
                            setState(() {
                              isOther = !isOther;
                            });
                            ref.read(serviceForPhotoProvider.notifier).state =
                                otherService;
                          },
                          service: otherService);
                    }
                    return ServiceContainer(
                      service: subServices[index],
                      onPressed: () {
                        ref.read(serviceForPhotoProvider.notifier).state =
                            subServices[index];
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Visibility(
                  visible: isOther,
                  child: TextFormField(
                    maxLength: 200,
                    decoration: const InputDecoration(
                        filled: true, hintText: "Add Notes Here"),
                    maxLines: 5,
                  ),
                )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: PrimaryButton(
          text: "Next",
          onPressed: () => context.push("/tack_photo"),
        ),
      ),
    );
  }
}
