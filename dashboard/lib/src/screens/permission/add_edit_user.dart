import 'package:flutter/material.dart';

class AddEditUser extends StatelessWidget {
  const AddEditUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          child: Column(
            spacing: 16,
            children: [
              TextFormField(
                decoration: const InputDecoration(hintText: "Full Name"),
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: "Email"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
