import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_monitor_app_flutter/router.dart';

class ErrorHandlingService {
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static Ref? _ref;

  static void init(Ref ref) {
    _ref = ref;
  }

  static void showAuthError() {
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: const Text('Your session has expired. Please sign in again.'),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 5),
        action: SnackBarAction(
          label: 'Sign In',
          onPressed: () {
            // @TODO: navigation here is nor working properly
            _ref?.read(routerProvider).go(appRoutesPath(AppRoute.login));
          },
        ),
      ),
    );
  }
}
