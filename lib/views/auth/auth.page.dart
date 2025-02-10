import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_monitor_app_flutter/views/login/login.screen.dart';

class AuthWrapper extends StatelessWidget {
  final Widget authenticatedChild;

  const AuthWrapper({
    super.key,
    required this.authenticatedChild,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return authenticatedChild;
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
