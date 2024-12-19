import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:refix/src/screens/auth/domain/notification.dart';

import '../../../core/ui/theme/colors.dart';
import '../../../core/ui/theme/radii.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifications = ref.watch(notificationsProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Notifications"),
          actions: [
            TextButton(
                onPressed: () {
                  ref.read(notificationsProvider.notifier).markRead();
                },
                child: const Text("Mark All As Read"))
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: notifications.when(
                data: (data) {
                  if (data.isEmpty) {
                    return const Center(
                        child: Text(
                      "You don't have notification at the moment , check later",
                      textAlign: TextAlign.center,
                    ));
                  }
                  return ListView.separated(
                      itemCount: data.length,
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 16,
                          ),
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppRadii.lg),
                              color: AppColors.white),
                          child: ListTile(
                            leading:
                                SvgPicture.asset("assets/img/home/add.svg"),
                            title: Text(data[index].title),
                          ),
                        );
                      });
                },
                error: (e, s) {
                  return const Center(
                    child: Text("Error"),
                  );
                },
                loading: () => const Center(
                    child: CircularProgressIndicator.adaptive()))));
  }
}
