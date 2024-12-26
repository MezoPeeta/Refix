import 'package:dashboard/src/screens/users/domain/users_domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/btns.dart';
import '../auth/data/auth_data.dart';

class AddEditWorker extends ConsumerStatefulWidget {
  const AddEditWorker({super.key, required this.worker});
  final Worker? worker;

  @override
  ConsumerState<AddEditWorker> createState() => _AddEditWorkerState();
}

class _AddEditWorkerState extends ConsumerState<AddEditWorker> {
  final nameController = TextEditingController();

  final companyController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  static final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool isEditting = false;

  @override
  void initState() {
    super.initState();
    if (widget.worker != null) {
      setState(() {
        isEditting = true;
        nameController.text = widget.worker!.username;
        companyController.text = widget.worker!.companyName;
        phoneController.text = widget.worker!.phone ?? "-";
        emailController.text = widget.worker!.email;
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
                  isEditting ? "Edit Worker" : "Add Worker",
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
                  controller: companyController,
                  keyboardType: TextInputType.number,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Please add company name";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(hintText: "Company Name"),
                ),
                TextFormField(
                  controller: phoneController,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Please add phone";
                    }
                    return null;
                  },
                  maxLength: 200,
                  maxLines: 5,
                  decoration: const InputDecoration(hintText: "Phone Number"),
                ),
                TextFormField(
                  controller: passwordController,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Please add password";
                    }
                    return null;
                  },
                  maxLength: 200,
                  maxLines: 5,
                  decoration: const InputDecoration(hintText: "Password"),
                ),
                PrimaryButton(
                    text: isEditting ? "Edit Worker" : "Add Worker",
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          loading = true;
                        });
                        if (isEditting) {
                          final status = await ref.read(updateWorkerProvider(
                                  id: widget.worker!.id,
                                  companyName: companyController.text,
                                  phone: phoneController.text,
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
                        final status = await ref.read(createWorkerProvider(
                                companyName: companyController.text,
                                phone: phoneController.text,
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
