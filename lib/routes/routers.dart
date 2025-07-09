import 'package:expense_tracker_app/features/auth/presentation/pages/login_page.dart';
import 'package:expense_tracker_app/features/auth/presentation/pages/register_page.dart';
import 'package:expense_tracker_app/features/splash/presentation/pages/splash_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(), // or your real page
    ),
    GoRoute(path: "/register", builder: (context, state) => const RegisterPage()), // Placeholder for register page
  ],
);
