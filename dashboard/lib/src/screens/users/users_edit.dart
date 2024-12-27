import 'package:dashboard/src/screens/users/domain/users_domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/btns.dart';
import '../auth/data/auth_data.dart';

class AddEditUser extends ConsumerStatefulWidget {
  const AddEditUser({super.key, required this.user});
  final User? user;

  @override
  ConsumerState<AddEditUser> createState() => _AddEditUserState();
}

class _AddEditUserState extends ConsumerState<AddEditUser> {
  final nameController = TextEditingController();

  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  static final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool isEditting = false;

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      setState(() {
        isEditting = true;
        nameController.text = widget.user!.username;
        phoneController.text =
            widget.user!.phone!.replaceAll("+966", "") ?? "-";
        emailController.text = widget.user!.email;
      });
    }
  }

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
                Text(
                  isEditting ? "Edit User" : "Add User",
                ),
                TextFormField(
                  controller: nameController,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Please add username";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(hintText: "Username"),
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
                TextFormField(
                  controller: passwordController,
                  validator: (v) {
                    if (isEditting) {
                      return null;
                    }
                    if (v!.isEmpty) {
                      return "Please add password";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(hintText: "Password"),
                ),
                PrimaryButton(
                    text: isEditting ? "Edit User" : "Add User",
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          loading = true;
                        });
                        if (isEditting) {
                          final status = await ref.read(updateUserProvider(
                                  id: widget.user!.id,
                                  phone: "+966${phoneController.text}",
                                  email: emailController.text,
                                  password: passwordController.text,
                                  username: nameController.text)
                              .future);
                          setState(() {
                            loading = false;
                          });
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(status)));
                          return;
                        }
                        final status = await ref.read(createUserProvider(
                                phone: "+966${phoneController.text}",
                                email: emailController.text,
                                password: passwordController.text,
                                username: nameController.text)
                            .future);
                        setState(() {
                          loading = false;
                        });
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(status)));
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
