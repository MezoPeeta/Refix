import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:refix/src/core/localization/domain.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/core/ui/widgets/button.dart';
import 'package:refix/src/screens/services/domain/booking_domain.dart';

import '../../../core/ui/theme/colors.dart';

final bookingIDProvider = StateProvider<String?>((ref) => null);

class PaymentMethods extends ConsumerStatefulWidget {
  const PaymentMethods({super.key});

  @override
  ConsumerState<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends ConsumerState<PaymentMethods> {
  String method = "CASH";
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final discount =
        ref.watch(getDiscountProvider(pageName: "New User Add Card"));
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr.payment_methods),
      ),
      body: Column(
        children: [
          discount.when(
              data: (data) {
                if (data != null && data.active != false) {
                  return Container(
                    color: AppColors.primary100,
                    height: 40,
                    width: MediaQuery.sizeOf(context).width,
                    child: Center(
                        child: Text(
                      data.heading?.localized ?? "",
                      style: const TextStyle(color: AppColors.primaryRefix),
                    )),
                  );
                }
                return const SizedBox.shrink();
              },
              error: (e, s) => const Text("Error"),
              loading: () => const SizedBox.shrink()),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppRadii.lg)),
              child: RadioListTile.adaptive(
                value: "CASH",
                groupValue: method,
                controlAffinity: ListTileControlAffinity.trailing,
                contentPadding: EdgeInsets.zero,
                onChanged: (v) {
                  setState(() {
                    method = "CASH";
                  });
                },
                title: Row(
                  spacing: 8,
                  children: [
                    SvgPicture.asset(
                      "assets/img/profile/cash.svg",
                    ),
                    Text(
                      context.tr.cash,
                      style: const TextStyle(fontSize: AppTextSize.three),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppRadii.lg)),
              child: Column(
                children: [
                  RadioListTile<String>.adaptive(
                    value: "CARD",
                    groupValue: method,
                    controlAffinity: ListTileControlAffinity.trailing,
                    contentPadding: EdgeInsets.zero,
                    onChanged: (v) {
                      setState(() {
                        method = "CARD";
                      });
                    },
                    title: Row(
                      spacing: 8,
                      children: [
                        SvgPicture.asset(
                          "assets/img/profile/visa.svg",
                        ),
                        Text(
                          context.tr.visa,
                          style: const TextStyle(fontSize: AppTextSize.three),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: PrimaryButton(
                text: context.tr.continuee,
                loading: loading,
                onPressed: () async {
                  setState(() {
                    loading = true;
                  });
                  final bookingID = ref.read(bookingIDProvider);
                  final result = await ref.read(updateBookingMethodProvider(
                          bookingID: bookingID!, method: method)
                      .future);

                  if (result == true) {
                    if (method == "CASH") {
                      return context.go("/success");
                    }
                    ref.read(paymentBookingProvider(bookingID: bookingID));
                  }
                  setState(() {
                    loading = false;
                  });
                }),
          )
        ],
      ),
    );
  }
}
