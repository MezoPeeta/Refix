import 'package:dashboard/src/app.dart';
import 'package:dashboard/src/screens/auth/presentation/login.dart';
import 'package:dashboard/src/screens/permission/domain/permission_domain.dart';
import 'package:dashboard/src/screens/rules/domain/rules_domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/btns.dart';
import '../auth/data/auth_data.dart';
import '../users/domain/users_domain.dart';

class AddEditPermission extends ConsumerStatefulWidget {
  const AddEditPermission({super.key, required this.user});
  final User? user;

  @override
  ConsumerState<AddEditPermission> createState() => _AddEditPermissionState();
}

class _AddEditPermissionState extends ConsumerState<AddEditPermission> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  static final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool isEditting = false;
  String? selectedRole;

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      setState(() {
        isEditting = true;
        nameController.text = widget.user!.username;
        selectedRole = widget.user!.role.id;
        phoneController.text =
            widget.user!.phone!.replaceAll("+966", "") ?? "-";
        emailController.text = widget.user!.email;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final roles = ref.watch(roleNotifierProvider);
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
                roles.when(data: (data) {
                  return DropdownButtonFormField(
                    value: selectedRole,
                    decoration: const InputDecoration(hintText: "Role"),
                    items: data
                        .map((e) =>
                            DropdownMenuItem(value: e.id, child: Text(e.name)))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedRole = value;
                      });
                    },
                  );
                }, error: (e, s) {
                  return const Text("Error");
                }, loading: () {
                  return const CircularProgressIndicator();
                }),
                TextFormField(
                  controller: nameController,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Please add name";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(hintText: "Name"),
                ),
                TextFormField(
                  controller: emailController,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Please add email";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(hintText: "Email"),
                ),
                TextFormField(
                  controller: phoneController,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Please add phone";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                  ],
                  decoration: const InputDecoration(
                      hintText: "Phone Number", icon: Text("+966")),
                ),
                PasswordFormField(passwordController: passwordController),
                PrimaryButton(
                    text: "Save",
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          loading = true;
                        });
                        if (isEditting) {
                          final status = await ref.read(
                              updatePermissionUserProvider(
                                      email: emailController.text,
                                      id: widget.user!.id,
                                      phone: phoneController.text,
                                      username: nameController.text,
                                      roleID: selectedRole!)
                                  .future);
                          ref
                              .read(scaffoldMessengerPod)
                              .showSnackBar(SnackBar(content: Text(status)));
                          setState(() {
                            loading = false;
                          });
                          return;
                        }
                        final status = await ref.read(
                            createPermissionUserProvider(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    username: nameController.text,
                                    phone: phoneController.text,
                                    roleID: selectedRole!)
                                .future);
                        ref
                            .read(scaffoldMessengerPod)
                            .showSnackBar(SnackBar(content: Text(status)));

                        setState(() {
                          loading = false;
                        });
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
