import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:refix/src/core/localization/domain.dart';
import 'package:refix/src/core/ui/widgets/button.dart';
import 'package:refix/src/screens/home/domain/home_domain.dart';
import 'package:refix/src/screens/services/data/bookin_data.dart';

class ReportBooking extends StatefulWidget {
  const ReportBooking({super.key, required this.booking});
  final Booking booking;
  @override
  State<ReportBooking> createState() => _ReportBookingState();
}

class _ReportBookingState extends State<ReportBooking> {
  bool loading = false;
  final controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr.report_problem_not_resolved),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          children: [
            Text(context.tr.fillInputBox),
            Form(
                key: formKey,
                child: TextFormField(
                  controller: controller,
                  maxLines: 5,
                  maxLength: 200,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                )),
            const Spacer(),
            Consumer(builder: (context, ref, child) {
              return PrimaryButton(
                  text: context.tr.second,
                  loading: loading,
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        loading = true;
                      });
                      final result = await ref.read(reportBookingProvider(
                              id: widget.booking.id, body: controller.text)
                          .future);
                      if (result != null) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(result)));
                        context.go("/");
                      }
                      setState(() {
                        loading = false;
                      });
                    }
                  });
            })
          ],
        ),
      ),
    );
  }
}
