import 'package:dashboard/src/screens/auth/data/auth_data.dart';
import 'package:dashboard/src/screens/navbar/widgets/header_text.dart';
import 'package:dashboard/src/screens/rules/domain/rules_domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/btns.dart';

class AddEditRule extends ConsumerStatefulWidget {
  const AddEditRule({super.key, required this.role});
  final Role? role;

  @override
  ConsumerState<AddEditRule> createState() => _AddEditRuleState();
}

class _AddEditRuleState extends ConsumerState<AddEditRule> {
  final nameController = TextEditingController();

  static final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool isEditting = false;
  List<Permission> selectedPermissions = [];

  @override
  void initState() {
    super.initState();
    if (widget.role != null) {
      setState(() {
        isEditting = true;
        nameController.text = widget.role!.name;
        selectedPermissions = widget.role!.permissions!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final permissions = ref.watch(getPermissionsProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                spacing: 16,
                children: [
                  isEditting
                      ? Row(
                          children: [
                            Text(
                              isEditting ? "Edit Role" : "Add Role",
                            ),
                            TextButton(
                                child: const Text("Delete Role"),
                                onPressed: () async {
                                  final status = await ref
                                      .read(roleNotifierProvider.notifier)
                                      .deleteRole(widget.role!.id);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(status)));
                                })
                          ],
                        )
                      : Text(
                          isEditting ? "Edit Role" : "Add Role",
                        ),
                  TextFormField(
                    controller: nameController,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Please add role name";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(hintText: "Role Name"),
                  ),
                  const HeaderText(text: "Permissions"),
                  permissions.when(
                      data: (data) {
                        return GridView.builder(
                            itemCount: isEditting
                                ? selectedPermissions.length
                                : data.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 350),
                            itemBuilder: (context, index) => Row(
                                  children: [
                                    Checkbox(
                                        value: !isEditting
                                            ? data[index].isSelected
                                            : selectedPermissions[index]
                                                    .isSelected ==
                                                false,
                                        onChanged: (v) {
                                          if (isEditting) {
                                            setState(() {
                                              selectedPermissions[index]
                                                  .isSelected = !v!;
                                            });
                                            return;
                                          }
                                          setState(() {
                                            data[index].isSelected = v!;
                                          });
                                        }),
                                    Text(data[index].name)
                                  ],
                                ));
                      },
                      error: (e, s) => const Text("Error loading permissions"),
                      loading: () =>
                          const Center(child: CircularProgressIndicator())),
                  PrimaryButton(
                      text: isEditting ? "Edit Role" : "Add Role",
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          final permissions =
                              await ref.read(getPermissionsProvider.future);

                          if (isEditting) {
                            final selectedPermissionsIDs =
                                selectedPermissions.map((e) => e.id).toList();
                            final status = await ref
                                .read(roleNotifierProvider.notifier)
                                .updateRole(
                                    id: widget.role!.id,
                                    permissionIDs: selectedPermissionsIDs,
                                    roleName: nameController.text);
                            setState(() {
                              loading = false;
                            });
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text(status)));
                            return;
                          }
                          final selectedPermissionsIDs = permissions
                              .where((e) => e.isSelected)
                              .map((e) => e.id)
                              .toList();
                          final status = await ref
                              .read(roleNotifierProvider.notifier)
                              .addRole(
                                  permissionIDs: selectedPermissionsIDs,
                                  roleName: nameController.text);
                          ScaffoldMessenger.of(context)
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
      ),
    );
  }
}
