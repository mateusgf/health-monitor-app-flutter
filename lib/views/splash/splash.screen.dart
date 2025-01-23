import 'dart:io';

import 'package:flutter/material.dart';
import 'package:health_monitor_app_flutter/logger.dart';
import 'package:health_monitor_app_flutter/providers/repositories.provider.dart';
import 'package:health_monitor_app_flutter/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

/// [SplashScreen] is the first screen shown to the user
/// it handles app initialization and routing to basics screens like
/// [OnboardingScreen], [HomeScreen] or even if needed [LoginScreen]
class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future(() async {
      // Check for routing
      bool onboardingDone =
          await ref.read(localDataRepositoryProvider).hasDoneOnboarding();
      if (!onboardingDone) {
        context.go(appRoutesPath(AppRoute.onboarding));
        return;
      }
    });
    return const Scaffold(
      body: Center(
        child: Text('TODO: SplashScreen'),
      ),
    );
  }
}
