import 'package:dashboard/src/core/navigation/auth.dart';
import 'package:dashboard/src/core/theme/btns.dart';
import 'package:dashboard/src/core/theme/colors.dart';
import 'package:dashboard/src/core/theme/radii.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
                child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset("assets/img/blue_logo.svg"),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(80.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Login",
                            style: TextStyle(
                                fontSize: AppTextSize.seven,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const Text(
                            "Welcome back, my friend",
                            style: TextStyle(
                                fontSize: 18,
                                color: AppColors.neutral400,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            controller: emailController,
                            validator: (v) {
                              if (v!.isEmpty) {
                                return "please enter email";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                hintText: "Email", filled: true),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          PasswordFormField(
                              passwordController: passwordController),
                          const SizedBox(
                            height: 16,
                          ),
                          Consumer(builder: (context, ref, child) {
                            return PrimaryButton(
                                text: "Login",
                                loading: loading,
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      loading = true;
                                    });
                                    final response = await ref
                                        .read(authProvider)
                                        .signin(
                                            email: emailController.text,
                                            password: passwordController.text);
                                    response.fold((v) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                              SnackBar(content: Text(v)));
                                    }, (v) => context.go("/"));
                                    setState(() {
                                      loading = false;
                                    });
                                  }
                                });
                          })
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.secondaryRefix,
                    borderRadius: BorderRadius.circular(16)),
                child: SvgPicture.asset(
                  "assets/img/logo.svg",
                  width: 300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PasswordFormField extends StatefulWidget {
  const PasswordFormField(
      {super.key,
      this.passwordText = "Password",
      this.passwordControllerText,
      required this.passwordController,
      this.validator});
  final String passwordText;
  final String? passwordControllerText;
  final String? Function(String?)? validator;
  final TextEditingController passwordController;

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.passwordController,
        obscureText: !isVisible,
        validator: widget.validator ??
            (password) {
              if (password!.isEmpty) {
                return "Please enter your password";
              }
              if (password.length <= 8 &&
                  widget.passwordControllerText == null) {
                return "Password must be atleast 8 letters";
              }

              return null;
            },
        decoration: InputDecoration(
            label: Text(widget.passwordText),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              child: Icon(
                isVisible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: AppColors.neutralRefix,
              ),
            )));
  }
}
