import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:refix/src/core/ui/theme/colors.dart';
import 'package:refix/src/core/ui/widgets/button.dart';
import 'package:refix/src/screens/services/presentation/services.dart';

import '../../../core/ui/theme/radii.dart';
import '../../../core/ui/widgets/header.dart';

class FinalstepScreen extends StatelessWidget {
  const FinalstepScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text(
              "Enter the name of the service here",
              style: TextStyle(fontSize: AppTextSize.two),
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
                  const ServiceContainer(name: "Services"),
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
                                      itemCount:
                                          [1, 2, 3, 4, 5, 6, "Other"].length,
                                      gridDelegate:
                                          const SliverGridDelegateWithMaxCrossAxisExtent(
                                              crossAxisSpacing: 24,
                                              mainAxisSpacing: 24,
                                              mainAxisExtent: 85,
                                              maxCrossAxisExtent: 116.67),
                                      itemBuilder: (context, index) {
                                        return ServiceContainer(
                                          name: [
                                            1,
                                            2,
                                            3,
                                            4,
                                            5,
                                            6,
                                            "Other"
                                          ][index]
                                              .toString(),
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
                  const AddedImage(),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
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
                onTap: () {
                  showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 50)));
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: PrimaryButton(
          text: "Booking Now",
          onPressed: () {},
        ),
      ),
    );
  }
}

class AddedImage extends StatelessWidget {
  const AddedImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          width: 77,
          height: 80,
          decoration: BoxDecoration(
              color: AppColors.neutral100,
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
