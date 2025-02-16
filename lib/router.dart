import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_monitor_app_flutter/views/home/home.screen.dart';
import 'package:health_monitor_app_flutter/views/login/login.screen.dart';
import 'package:health_monitor_app_flutter/views/onboarding/onboarding.screen.dart';
import 'package:health_monitor_app_flutter/views/register/register.screen.dart';
import 'package:health_monitor_app_flutter/views/sleep_tracking_detail/sleep_tracking_detail.screen.dart';
import 'package:health_monitor_app_flutter/views/splash/splash.screen.dart';
import 'package:health_monitor_app_flutter/views/subscriptions/subscriptions.screen.dart';
import 'package:health_monitor_app_flutter/views/sleep_tracks/sleep_tracks.screen.dart';
import 'package:health_monitor_app_flutter/views/auth/auth.page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  auth,
  splash,
  onboarding,
  login,
  register,
  home,
  subscriptions,
  sleep_tracks,
  sleep_details,
}

/// Returns the path for the given route
/// Uses [route] The route to get the path for and an optional [id]
/// if needed
String appRoutesPath(AppRoute route, {String? id}) => switch (route) {
      AppRoute.auth => '/auth',
      AppRoute.splash => '/splash',
      AppRoute.onboarding => '/onboarding',
      AppRoute.login => '/login',
      AppRoute.register => '/register',
      AppRoute.home => '/',
      AppRoute.subscriptions => '/subscriptions',
      AppRoute.sleep_tracks => '/sleep_tracks',
      AppRoute.sleep_details => '/sleep_details/$id',
    };

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: appRoutesPath(AppRoute.home),
    redirect: (BuildContext context, GoRouterState state) {
      // List of routes that don't require authentication
      final allowedRoutes = [
        appRoutesPath(AppRoute.login),
        appRoutesPath(AppRoute.register),
      ];

      final isAllowedRoute = allowedRoutes.contains(state.uri.toString());

      final isAuthenticated = FirebaseAuth.instance.currentUser != null;

      print('User in redirect ${FirebaseAuth.instance.currentUser}');

      if (!isAllowedRoute && !isAuthenticated) {
        return appRoutesPath(AppRoute.login);
      }

      // If authenticated and trying to access auth/login/register, redirect to home
      if (isAuthenticated &&
          (state.uri.toString() == appRoutesPath(AppRoute.login) ||
              state.uri.toString() == appRoutesPath(AppRoute.register))) {
        return appRoutesPath(AppRoute.home);
      }

      // Allow navigation
      return null;
    },
    routes: [
      GoRoute(
        path: appRoutesPath(AppRoute.home),
        pageBuilder: (context, state) => const MaterialPage(
          child: AuthWrapper(
            authenticatedChild: HomeScreen(),
          ),
        ),
      ),
      GoRoute(
        path: appRoutesPath(AppRoute.sleep_tracks),
        pageBuilder: (context, state) => const MaterialPage(
          child: AuthWrapper(
            authenticatedChild: SleepTracks(),
          ),
        ),
      ),
      GoRoute(
        path: appRoutesPath(AppRoute.sleep_details, id: ':id'),
        pageBuilder: (context, state) {
          final id = state.pathParameters['id'];
          return MaterialPage(
            child: AuthWrapper(
              authenticatedChild: SleepTrackingDetailScreen(id: id),
            ),
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
        pageBuilder: (context, state) => MaterialPage(
          child: LoginScreen(),
        ),
      ),
      GoRoute(
        path: appRoutesPath(AppRoute.register),
        pageBuilder: (context, state) => MaterialPage(
          child: RegisterScreen(),
        ),
      ),
      GoRoute(
        path: appRoutesPath(AppRoute.subscriptions),
        pageBuilder: (context, state) => const MaterialPage(
          child: AuthWrapper(
            authenticatedChild: SubscriptionsScreen(),
          ),
        ),
      ),
    ],
  );
});
