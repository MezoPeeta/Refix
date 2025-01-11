import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:worker/src/core/localization/domain.dart';

import '../../core/theme/colors.dart';
import '../../core/theme/radii.dart';
import 'domain/notifications_domain.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifications = ref.watch(notificationsProvider);
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(context.tr.notifications),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: notifications.when(
                data: (data) {
                  if (data.isEmpty) {
                    return Center(
                        child: Text(
                      context.tr.noNotifications,
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
                            leading: Icon(Icons.notifications),
                            title: Text(data[index].title),
                          ),
                        );
                      });
                },
                error: (e, s) {
                  log("Notification Error", error: e, stackTrace: s);
                  return const Center(
                    child: Text("Error"),
                  );
                },
                loading: () => const Center(
                    child: CircularProgressIndicator.adaptive()))));
  }
}
