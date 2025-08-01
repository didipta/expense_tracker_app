import 'package:expense_tracker_app/shared/widgets/language_widget.dart';
import 'package:expense_tracker_app/shared/widgets/logo_widget.dart';
import 'package:expense_tracker_app/features/auth/presentation/widgets/social_media_login.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../localization/l10n/app_localizations.dart';
import '../blocs/auth_bloc.dart';
import '../blocs/auth_event.dart';
import '../blocs/auth_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPasswordVisible = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(child: CircularProgressIndicator()),
            );
          } else if (state is AuthSuccess) {
            Navigator.of(context).pop(); // Close loading
            context.go('/home');
          } else if (state is AuthFailure) {
            Navigator.of(context).pop(); // Close loading
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error.toString())),
            );
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 92.h),
            child: Column(
              children: [
                const LogoWidget(),
                SizedBox(height: 32.h),
                Text(
                  AppLocalizations.of(context).loginheader,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32.h),

                // Email Input
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).emailinput,
                    labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: const Color(0xFFBDBDBD),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),

                // Password Input
                TextField(
                  controller: _passwordController,
                  obscureText: isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).passwordinput,
                    labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: const Color(0xFFBDBDBD),
                      fontWeight: FontWeight.w400,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      child: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: const Color(0xFF6A707C),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    AppLocalizations.of(context).forgotpassword,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: const Color(0xFF6A707C),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 80.h),

                // Login Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      await FirebaseAnalytics.instance.logLogin(loginMethod:_emailController.text );

                      // 🔥 Dispatch LoginRequested event to AuthBloc
                      context.read<AuthBloc>().add(
                        LoginRequested(
                          email: _emailController.text,
                          password: _passwordController.text,
                        ),
                      );
                    },
                    child: Text(
                      AppLocalizations.of(context).loginbutton,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 48.h),
                Text(
                  AppLocalizations.of(context).orloginwith,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: 16.h),
                const SocialMediaLogin(),
                SizedBox(height: 80.h),

                // Register
                RichText(
                  text: TextSpan(
                    text: AppLocalizations.of(context).dontaccount,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: AppLocalizations.of(context).registernow,
                        style:
                        Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.go('/register');
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

