import 'package:dashboard/src/screens/notification/data/source.dart';
import 'package:dashboard/src/screens/users/domain/users_domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/btns.dart';
import '../auth/data/auth_data.dart';

class NotificationAdd extends ConsumerStatefulWidget {
  const NotificationAdd({super.key});

  @override
  ConsumerState<NotificationAdd> createState() => _NotificationAddState();
}

class _NotificationAddState extends ConsumerState<NotificationAdd> {
  final nameController = TextEditingController();

  final bodyController = TextEditingController();

  static final _formKey = GlobalKey<FormState>();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 16,
              children: [
                const Text(
                  "Add Notification",
                ),
                TextFormField(
                  controller: nameController,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Please add title";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(hintText: "Title"),
                ),
                TextFormField(
                  controller: bodyController,
                  keyboardType: TextInputType.number,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Please add Body";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(hintText: "Body"),
                ),
                PrimaryButton(
                    text: "Send Notifications to Everyone",
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          loading = true;
                        });

                        await ref
                            .read(notificationsNotifierProvider.notifier)
                            .send(
                                title: nameController.text,
                                body: bodyController.text);
                        setState(() {
                          loading = false;
                        });
                        context.pop();
                      }
                    },
                    loading: loading)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
