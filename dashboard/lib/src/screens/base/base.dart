import 'package:dashboard/src/core/theme/colors.dart';
import 'package:dashboard/src/screens/ads/ads.dart';
import 'package:dashboard/src/screens/ads/ads_edit.dart';
import 'package:dashboard/src/screens/content/onetime.dart';
import 'package:dashboard/src/screens/content/onetime_edit.dart';
import 'package:dashboard/src/screens/navbar/navbar.dart';
import 'package:dashboard/src/screens/users/client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../booking/presentation/booking.dart';
import '../home/home.dart';
import '../permission/permissions.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});
  static final List<Widget> children = [
    const HomeScreen(),
    const ClientScreen(),
    const ClientScreen(),
    const ClientScreen(),
    const OnetimeScreen(),
    const OnetimeEditScreen(),
    const AdsScreen(),
    const AdsEditScreen(),
    const BookingScreen(),
    const SizedBox.shrink(),
    const SizedBox.shrink(),
    const SizedBox.shrink(),
    const SizedBox.shrink(),
    const PermissionsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Navbar(),
          Consumer(builder: (context, ref, child) {
            final currentIndex = ref.watch(currentIndexProvider);
            return Expanded(flex: 4, child: children[currentIndex]);
          }),
        ],
      ),
    );
  }
}

class PrevButton extends ConsumerWidget {
  const PrevButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          ref.read(currentIndexProvider.notifier).update((state) => state - 1);
        },
        icon: const Icon(Icons.arrow_back_ios));
  }
}
