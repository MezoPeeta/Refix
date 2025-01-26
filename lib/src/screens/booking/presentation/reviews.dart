import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:refix/src/core/localization/domain.dart';
import 'package:refix/src/core/ui/theme/colors.dart';
import 'package:refix/src/core/ui/theme/radii.dart';
import 'package:refix/src/core/ui/widgets/button.dart';
import 'package:refix/src/screens/services/data/bookin_data.dart';
import 'package:refix/src/screens/services/domain/booking_domain.dart';

class BookingReviews extends StatefulWidget {
  const BookingReviews({super.key, required this.booking});
  final Booking booking;

  @override
  State<BookingReviews> createState() => _BookingReviewsState();
}

class _BookingReviewsState extends State<BookingReviews> {
  double bookingRating = 0;
  final noteController = TextEditingController();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(context.tr.addReview),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://api.refixapp.com/${widget.booking.services.first.image}"),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RatingBar.builder(
                      initialRating: 0,
                      minRating: 1,
                      direction: Axis.horizontal,
                      itemSize: 25,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star_rounded,
                        color: AppColors.primaryRefix,
                      ),
                      onRatingUpdate: (rating) {
                        setState(() {
                          bookingRating = rating;
                        });
                      },
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                maxLength: 200,
                maxLines: 5,
                controller: noteController,
                decoration: InputDecoration(hintText: context.tr.add_notes),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Consumer(builder: (context, ref, child) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: PrimaryButton(
                    text: context.tr.sendReview,
                    loading: loading,
                    onPressed: () async {
                      if (bookingRating == 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(context.tr.addStars)));
                        return;
                      }
                      setState(() {
                        loading = true;
                      });
                      final result = await ref.read(addBookingReviewProvider(
                              rating: bookingRating,
                              comment: noteController.text,
                              bookingID: widget.booking.id)
                          .future);

                      setState(() {
                        loading = false;
                      });
                      if (!context.mounted) return;
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(result)));
                      context.pop();
                    }),
              );
            })
          ],
        ),
      ),
    );
  }
}
