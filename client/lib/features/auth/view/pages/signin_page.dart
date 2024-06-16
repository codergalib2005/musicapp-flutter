import 'package:client/core/theme/app_pallete.dart';
import 'package:client/features/auth/view/widgets/auth_gradient_buton.dart';
import 'package:client/features/auth/view/widgets/custom_field.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    // ? the disposable
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Sign in",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  CustomField(
                    controller: emailController,
                    hintText: "Email",
                  ),
                  const SizedBox(height: 15),
                  CustomField(
                    controller: passwordController,
                    hintText: "Password",
                    isObscureText: true,
                  ),
                  const SizedBox(height: 15),
                  AuthGradientButon(btnText: "Sign in"),
                  const SizedBox(height: 20),
                  RichText(
                      text: TextSpan(
                    text: "Don't have account? ",
                    style: Theme.of(context).textTheme.titleMedium,
                    children: const [
                      TextSpan(
                        text: "Sign up",
                        style: TextStyle(color: Pallete.gradient2),
                      )
                    ],
                  ))
                ],
              ),
            )));
  }
}
