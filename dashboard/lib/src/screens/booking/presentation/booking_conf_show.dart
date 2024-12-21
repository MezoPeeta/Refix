import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theme/btns.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/radii.dart';
import 'booking.dart';

class BookingConfShow extends StatelessWidget {
  const BookingConfShow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(child: Text("Client Details")),
                const Divider(),
                const TextHeader(
                  text: "Select Service Name",
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(
                  height: 16,
                ),
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
                                        loading: false,
                                        text: "Add Services",
                                        onPressed: () {})
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
                const Text(
                  "If you have any questions, please fill in the input box below.If you have any questions, please fill in the input box below.",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: AppTextSize.one,
                      color: AppColors.neutralRefix),
                ),
                const SizedBox(height: 24),
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
                    const AddedImage(
                      path: "",
                    ),
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
                      hintText: "Phone Number",
                      filled: true,
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
                  decoration: InputDecoration(
                      hintText: "Add Address",
                      filled: true,
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
                  maxLength: 200,
                  maxLines: 8,
                  decoration: const InputDecoration(
                    hintText: "Add Notes",
                    filled: true,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  height: 58,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryRefix),
                    borderRadius: BorderRadius.circular(AppRadii.lg),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Cost Of Service",
                        style: TextStyle(fontSize: AppTextSize.two),
                      ),
                      Text(
                        "12.5 SAR",
                        style: TextStyle(fontSize: AppTextSize.two),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                PrimaryButton(
                    text: "Add Worker", onPressed: () {}, loading: false)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
