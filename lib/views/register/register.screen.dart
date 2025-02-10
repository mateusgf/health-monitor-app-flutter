import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_monitor_app_flutter/router.dart';
import 'package:health_monitor_app_flutter/views/components/health_button.dart';
import 'package:health_monitor_app_flutter/views/components/health_textfield.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();

  bool isLoading = false;

  void registerUser() async {
    setState(() {
      isLoading = true;
    });

    // Show loading dialog
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // Check if passwords match
    if (passwordController.text != confirmPasswordController.text) {
      Navigator.pop(context);
      setState(() {
        isLoading = false;
      });

      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text('Passwords do not match'),
            );
          });
      return;
    }

    try {
      // Create user with email and password
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Optional: Update user profile with name
      await userCredential.user?.updateDisplayName(nameController.text);

      Navigator.pop(context);
      setState(() {
        isLoading = false;
      });
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      setState(() {
        isLoading = false;
      });

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Registration Error'),
              content: Text(e.message ?? 'An error occurred'),
            );
          });
    }
  }

  void goToLoginScreen(WidgetRef ref) {
    ref.read(routerProvider).go(appRoutesPath(AppRoute.login));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDE7DC),
      body: SafeArea(
        child: Consumer(
          builder: (context, ref, child) {
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    // Logo
                    const Icon(
                      Icons.app_registration,
                      size: 100,
                    ),
                    const SizedBox(height: 50),
                    // Name textfield
                    HealthTextfield(
                      controller: nameController,
                      hintText: 'Full Name',
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),
                    // E-mail textfield
                    HealthTextfield(
                      controller: emailController,
                      hintText: 'E-mail',
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),
                    // Password textfield
                    HealthTextfield(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                    // Confirm Password textfield
                    HealthTextfield(
                      controller: confirmPasswordController,
                      hintText: 'Confirm Password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 25),
                    // Register button
                    HealthButton(
                      onTap: registerUser,
                      child: const Text("Register",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          )),
                    ),
                    const SizedBox(height: 50),
                    // Already have an account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () => goToLoginScreen(ref),
                          child: const Text(
                            'Login now',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
