import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_monitor_app_flutter/views/components/health_button.dart';
import 'package:health_monitor_app_flutter/views/components/health_textfield.dart';
import 'package:health_monitor_app_flutter/views/components/square_tile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  void signUserIn() async {
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

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
      setState(() {
        isLoading = false;
      });
    } on FirebaseAuthException catch (e) {
      print('Error: $e');

      Navigator.pop(context);
      setState(() {
        isLoading = false;
      });

      if (e.code == 'invalid-credential') {
        wrongCredentials();
      }
    }

    // Listen to auth state changes // @TODO: remove
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  void wrongCredentials() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Wrong credentials'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDE7DC),
      body: SafeArea(
        child: Consumer(
          builder: (context, ref, child) {
            // You can still use Riverpod providers here if needed
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  // Logo
                  const Icon(
                    Icons.lock,
                    size: 100,
                  ),
                  const SizedBox(height: 50),
                  const SizedBox(height: 25),
                  // E-mail textfield
                  HealthTextfield(
                    controller: emailController,
                    hintText: 'E-mail',
                    obscureText: false,
                    // @TODO: remove
                    initialValue: 'test@email.com',
                  ),
                  const SizedBox(height: 10),
                  // Password textfield
                  HealthTextfield(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                    // @TODO: remove
                    initialValue: 'test123',
                  ),
                  const SizedBox(height: 10),
                  // Forgot password?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  // Sign in button
                  HealthButton(
                    onTap: signUserIn,
                  ),
                  const SizedBox(height: 50),
                  // Or continue with
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Or continue with',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      // Google button
                      SquareTile(imagePath: 'assets/images/google.png'),
                      SizedBox(width: 25),
                      // Apple button
                      SquareTile(imagePath: 'assets/images/apple.png')
                    ],
                  ),
                  const SizedBox(height: 50),
                  // Create account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
