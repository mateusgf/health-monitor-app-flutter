import 'package:flutter/material.dart';
import 'package:health_monitor_app_flutter/views/home/home.screen.dart';
import 'package:health_monitor_app_flutter/views/login/login.screen.dart';
import 'package:health_monitor_app_flutter/views/onboarding/onboarding.screen.dart';
import 'package:health_monitor_app_flutter/views/sleep_tracking_detail/sleep_tracking_detail.screen.dart';
import 'package:health_monitor_app_flutter/views/splash/splash.screen.dart';
import 'package:health_monitor_app_flutter/views/subscriptions/subscriptions.screen.dart';
import 'package:health_monitor_app_flutter/views/sleep_tracks/sleep_tracks.screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  splash,
  onboarding,
  login,
  home,
  subscriptions,
  sleep_tracks,
  sleep_details,
}

/// Returns the path for the given route
/// Uses [route] The route to get the path for and an optional [id]
/// if needed
String appRoutesPath(AppRoute route, {String? id}) => switch (route) {
      AppRoute.splash => '/splash',
      AppRoute.onboarding => '/onboarding',
      AppRoute.login => '/login',
      AppRoute.home => '/',
      AppRoute.subscriptions => '/subscriptions',
      AppRoute.sleep_tracks => '/sleep_tracks',
      AppRoute.sleep_details => '/sleep_details/$id',
    };

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: appRoutesPath(AppRoute.home),
    routes: [
      GoRoute(
        path: appRoutesPath(AppRoute.sleep_tracks),
        pageBuilder: (context, state) => const MaterialPage(
          child: SleepTracks(),
        ),
      ),
      GoRoute(
        path: appRoutesPath(AppRoute.sleep_details, id: ':id'),
        pageBuilder: (context, state) {
          final id = state.pathParameters['id'];
          return MaterialPage(
            child: SleepTrackingDetailScreen(id: id),
          );
        },
      ),
      GoRoute(
        path: appRoutesPath(AppRoute.splash),
        pageBuilder: (context, state) => const MaterialPage(
          child: SplashScreen(),
        ),
      ),
      GoRoute(
        path: appRoutesPath(AppRoute.onboarding),
        pageBuilder: (context, state) => const MaterialPage(
          child: OnboardingScreen(),
        ),
      ),
      GoRoute(
        path: appRoutesPath(AppRoute.login),
        pageBuilder: (context, state) => const MaterialPage(
          child: LoginScreen(),
        ),
      ),
      GoRoute(
        path: appRoutesPath(AppRoute.home),
        pageBuilder: (context, state) => const MaterialPage(
          child: HomeScreen(),
        ),
      ),
      GoRoute(
        path: appRoutesPath(AppRoute.subscriptions),
        pageBuilder: (context, state) => const MaterialPage(
          child: SubscriptionsScreen(),
        ),
      ),
    ],
  );
});
