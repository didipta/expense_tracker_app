import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:expense_tracker_app/features/auth/presentation/pages/login_page.dart';
import 'package:expense_tracker_app/features/auth/presentation/pages/register_page.dart';
import 'package:expense_tracker_app/features/expense/presentation/pages/add_expense_screen.dart';
import 'package:expense_tracker_app/features/home/presentation/pages/home_page.dart';
import 'package:expense_tracker_app/features/main_bottom_nav/presentation/page/main_botton_nav.dart';
import 'package:expense_tracker_app/features/splash/presentation/pages/splash_page.dart';

import '../app/network_setup/configurations.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  redirect: (context, state) {
    final isLoggedIn = Configurations.token.isNotEmpty;
    final isLoggingIn = state.matchedLocation == '/login' || state.matchedLocation == '/register';

    if (!isLoggedIn && !isLoggingIn && state.matchedLocation != '/') {
      return '/login'; // Redirect unauthenticated users to login
    }

    if (isLoggedIn && isLoggingIn) {
      return '/home'; // Redirect logged-in users away from login/register
    }

    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: "/register",
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: "/home",
      builder: (context, state) => const MainBottomNav(),
    ),
    GoRoute(
      path: "/add-expense",
      builder: (context, state) => const AddExpenseScreen(),
    ),
  ],
);
