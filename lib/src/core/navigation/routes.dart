import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:refix/src/core/navigation/base.dart';
import 'package:refix/src/core/storage/secure_storage.dart';
import 'package:refix/src/screens/auth/need_login.dart';
import 'package:refix/src/screens/auth/presentation/create_password.dart';
import 'package:refix/src/screens/auth/presentation/forget_password.dart';
import 'package:refix/src/screens/auth/presentation/login.dart';
import 'package:refix/src/screens/auth/presentation/notifications.dart';
import 'package:refix/src/screens/auth/presentation/otp_verification.dart';
import 'package:refix/src/screens/boarding/data/boarding_data.dart';
import 'package:refix/src/screens/booking/presentation/booking_failure.dart';
import 'package:refix/src/screens/booking/presentation/booking_final.dart';
import 'package:refix/src/screens/booking/presentation/report_booking.dart';
import 'package:refix/src/screens/points/presentation/redeem_points.dart';
import 'package:refix/src/screens/profile/presentation/about_refix.dart';
import 'package:refix/src/screens/profile/presentation/new_email.dart';
import 'package:refix/src/screens/profile/presentation/new_phone.dart';
import 'package:refix/src/screens/profile/presentation/payment_methods.dart';
import 'package:refix/src/screens/profile/presentation/payment_web_view.dart';
import 'package:refix/src/screens/profile/presentation/privacy.dart';
import 'package:refix/src/screens/profile/presentation/switch_phone.dart';
import 'package:refix/src/screens/profile/presentation/terms.dart';
import 'package:refix/src/screens/profile/presentation/user_profile.dart';
import 'package:refix/src/screens/auth/presentation/sign_up.dart';
import 'package:refix/src/screens/boarding/presentation/boarding.dart';
import 'package:refix/src/screens/booking/presentation/cancel_reason.dart';
import 'package:refix/src/screens/booking/presentation/inbooking.dart';
import 'package:refix/src/screens/booking/presentation/reviews.dart';
import 'package:refix/src/screens/reviews/presentation/reviews.dart';
import 'package:refix/src/screens/services/data/bookin_data.dart';
import 'package:refix/src/screens/services/presentation/booking_done.dart';
import 'package:refix/src/screens/services/presentation/final_step.dart';
import 'package:refix/src/screens/services/presentation/more_services.dart';
import 'package:refix/src/screens/services/presentation/services.dart';
import 'package:refix/src/screens/services/presentation/tackphoto.dart';

import '../../screens/home/data/home_data.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return routes;
});

final routes = GoRouter(
    initialLocation: "/boarding",
    redirect: (BuildContext context, GoRouterState state) async {
      final accessToken = await SecureStorage().read(key: "access_token");
      if (accessToken != null) {
        if (state.uri.toString() == '/boarding') {
          return '/';
        }
        return null;
      }

      return null;
    },
    routes: [
      GoRoute(path: "/", builder: (context, state) => const BaseWidget()),
      GoRoute(
          path: "/services/:type",
          name: "Services",
          builder: (context, state) => ServicesScreen(
                name: state.extra as String,
                type: state.pathParameters["type"] as String,
              )),
      GoRoute(
          path: "/reviews",
          builder: (context, state) => ReviewsScreen(
                type: state.extra as String,
              )),
      GoRoute(
          name: "moreServices",
          path: "/more_services/:name",
          builder: (context, state) => MoreServicesScreen(
                name: state.pathParameters["name"]!,
              )),
      GoRoute(
          path: "/need_login",
          builder: (context, state) => const NeedLoginScreen()),
      GoRoute(
          path: "/tack_photo/:type",
          name: "TackPhoto",
          builder: (context, state) => TackphotoScreen(
                service: state.extra as Service,
                type: state.pathParameters["type"]!,
              )),
      GoRoute(
          path: "/final_step/:service/:photo/:type",
          name: "FinalStep",
          builder: (context, state) => FinalstepScreen(
                service: state.pathParameters["service"]!,
                photo: state.pathParameters["photo"]!,
                type: state.pathParameters["type"]!,
              )),
      GoRoute(
          path: "/booking_done/:cost/:points",
          name: "BookingDone",
          builder: (context, state) => BookingdoneScreen(
                discount: state.extra as Discount,
                pointsPercentage:
                    int.tryParse(state.pathParameters["points"]!) ?? 0,
                cost: double.parse(state.pathParameters["cost"]!),
              )),
      GoRoute(path: "/login", builder: (context, state) => const LoginScreen()),
      GoRoute(
          path: "/forget_password",
          builder: (context, state) => const ForgetPasswordScreen()),
      GoRoute(
          path: "/otp_verify",
          builder: (context, state) =>
              OtpVerification(email: state.extra as String)),
      GoRoute(
          path: "/create_pass",
          builder: (context, state) => CreatePasswordScreen(
                otp: state.extra as String,
              )),
      GoRoute(
          path: "/sign_up", builder: (context, state) => const SignupScreen()),
      GoRoute(
          path: "/in_booking",
          name: "InBooking",
          builder: (context, state) => InbookingScreen(
                booking: state.extra as Booking,
              )),
      GoRoute(
          path: "/cancel_booking",
          builder: (context, state) => const CancelReasonScreen()),
      GoRoute(
          path: "/booking_reviews",
          builder: (context, state) => BookingReviews(
                booking: state.extra as Booking,
              )),
      GoRoute(
          path: "/boarding",
          builder: (context, state) => const BoardingScreen()),
      GoRoute(
          path: "/profile", builder: (context, state) => const UserProfile()),
      GoRoute(
          path: "/switch_phone",
          builder: (context, state) =>
              SwitchPhone(phone: state.extra as String?)),
      GoRoute(
          path: "/new_phone",
          builder: (context, state) => NewPhone(phone: state.extra as String?)),
      GoRoute(
          path: "/new_email",
          builder: (context, state) => NewEmail(
                email: state.extra as String,
              )),
      GoRoute(
          path: "/payment_method",
          builder: (context, state) => const PaymentMethods()),
      GoRoute(path: "/privacy", builder: (context, state) => const Privacy()),
      GoRoute(
          path: "/booking/report",
          builder: (context, state) => ReportBooking(
                booking: state.extra as Booking,
              )),
      GoRoute(
          path: "/redeem",
          builder: (context, state) => RedeemPoints(
                percentage: state.extra as String,
              )),
      GoRoute(
          path: "/terms",
          builder: (context, state) => const TermsAndConditions()),
      GoRoute(path: "/about", builder: (context, state) => const AboutRefix()),
      GoRoute(
          path: "/payment_web",
          builder: (context, state) => PaymentWebView(
                url: state.extra as String,
              )),
      GoRoute(
          path: "/notifications",
          builder: (context, state) => const NotificationsScreen()),
      GoRoute(
          path: "/success",
          builder: (context, state) => const BookingSuccess()),
      GoRoute(
          path: "/failure",
          builder: (context, state) => const BookingFailure()),
    ]);
