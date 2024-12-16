import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:refix/src/core/navigation/base.dart';
import 'package:refix/src/core/storage/secure_storage.dart';
import 'package:refix/src/screens/auth/need_login.dart';
import 'package:refix/src/screens/auth/presentation/forget_password.dart';
import 'package:refix/src/screens/auth/presentation/login.dart';
import 'package:refix/src/screens/auth/presentation/otp_verification.dart';
import 'package:refix/src/screens/profile/presentation/about_refix.dart';
import 'package:refix/src/screens/profile/presentation/new_phone.dart';
import 'package:refix/src/screens/profile/presentation/payment_methods.dart';
import 'package:refix/src/screens/profile/presentation/privacy.dart';
import 'package:refix/src/screens/profile/presentation/switch_phone.dart';
import 'package:refix/src/screens/profile/presentation/terms.dart';
import 'package:refix/src/screens/profile/presentation/user_profile.dart';
import 'package:refix/src/screens/auth/presentation/sign_up.dart';
import 'package:refix/src/screens/boarding/presentation/boarding.dart';
import 'package:refix/src/screens/booking/presentation/cancel_reason.dart';
import 'package:refix/src/screens/booking/presentation/inbooking.dart';
import 'package:refix/src/screens/booking/presentation/report_booking.dart';
import 'package:refix/src/screens/booking/presentation/reviews.dart';
import 'package:refix/src/screens/reviews/presentation/reviews.dart';
import 'package:refix/src/screens/services/presentation/booking_done.dart';
import 'package:refix/src/screens/services/presentation/final_step.dart';
import 'package:refix/src/screens/services/presentation/more_services.dart';
import 'package:refix/src/screens/services/presentation/services.dart';
import 'package:refix/src/screens/services/presentation/tackphoto.dart';

import '../../screens/notifications/presentation/notifications.dart';

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

      return '/boarding';
    },
    routes: [
      GoRoute(path: "/", builder: (context, state) => const BaseWidget()),
      GoRoute(
          path: "/services",
          builder: (context, state) => const ServicesScreen()),
      GoRoute(
          path: "/reviews", builder: (context, state) => const ReviewsScreen()),
      GoRoute(
          path: "/notifications",
          builder: (context, state) => const NotifiationsScreen()),
      GoRoute(
          path: "/more_services",
          builder: (context, state) => const MoreServicesScreen()),
      GoRoute(
          path: "/need_login",
          builder: (context, state) => const NeedLoginScreen()),
      GoRoute(
          path: "/tack_photo",
          builder: (context, state) => const TackphotoScreen()),
      GoRoute(
          path: "/final_step",
          builder: (context, state) => const FinalstepScreen()),
      GoRoute(
          path: "/booking_done",
          builder: (context, state) => const BookingdoneScreen()),
      GoRoute(path: "/login", builder: (context, state) => const LoginScreen()),
      GoRoute(
          path: "/forget_password",
          builder: (context, state) => const ForgetPasswordScreen()),
      GoRoute(
          path: "/otp_verify",
          builder: (context, state) => const OtpVerification()),
      GoRoute(
          path: "/sign_up", builder: (context, state) => const SignupScreen()),
      GoRoute(
          path: "/in_booking",
          builder: (context, state) => const InbookingScreen()),
      GoRoute(
          path: "/cancel_booking",
          builder: (context, state) => const CancelReasonScreen()),
      GoRoute(
          path: "/booking_reviews",
          builder: (context, state) => const BookingReviews()),
      GoRoute(
          path: "/booking_report",
          builder: (context, state) => const ReportBooking()),
      GoRoute(
          path: "/boarding",
          builder: (context, state) => const BoardingScreen()),
      GoRoute(
          path: "/profile", builder: (context, state) => const UserProfile()),
      GoRoute(
          path: "/switch_phone",
          builder: (context, state) => const SwitchPhone()),
      GoRoute(
          path: "/new_phone", builder: (context, state) => const NewPhone()),
      GoRoute(
          path: "/payment_method",
          builder: (context, state) => const PaymentMethods()),
      GoRoute(path: "/privacy", builder: (context, state) => const Privacy()),
      GoRoute(
          path: "/terms",
          builder: (context, state) => const TermsAndConditions()),
      GoRoute(path: "/about", builder: (context, state) => const AboutRefix()),
    ]);
