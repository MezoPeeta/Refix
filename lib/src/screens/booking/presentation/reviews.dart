import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:refix/src/core/ui/theme/colors.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/core/ui/widgets/button.dart';

class BookingReviews extends StatelessWidget {
  const BookingReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 184,
                      height: 40,
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) => const Icon(
                                Icons.star_rounded,
                                color: AppColors.primaryRefix,
                              )),
                    ),
                    const Text(
                      "Great!",
                      style: TextStyle(fontSize: AppTextSize.one),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text("Feature Here")
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text("Feature Here")
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text("Feature Here")
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                maxLength: 200,
                maxLines: 5,
                decoration: const InputDecoration(hintText: "Add Notes here"),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  SvgPicture.asset("assets/img/booking/coing.svg"),
                  const SizedBox(
                    width: 16,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Thank the Worker name here",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: AppTextSize.two),
                      ),
                      Text(
                        "Worker will receive 100% of the tip",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: AppTextSize.one),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(AppRadii.lg)),
                child: const IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "3 SAR",
                        style: TextStyle(fontSize: AppTextSize.two),
                      ),
                      VerticalDivider(
                        thickness: 1,
                        color: Colors.black,
                      ),
                      Text(
                        "6 SAR",
                        style: TextStyle(fontSize: AppTextSize.two),
                      ),
                      VerticalDivider(
                        thickness: 1,
                        color: Colors.black,
                      ),
                      Text(
                        "9 SAR",
                        style: TextStyle(fontSize: AppTextSize.two),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: PrimaryButton(text: "Send", onPressed: () {}),
            )
          ],
        ),
      ),
    );
  }
}
