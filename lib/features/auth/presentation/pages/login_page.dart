import 'package:expense_tracker_app/shared/widgets/logo_widget.dart';
import 'package:expense_tracker_app/shared/widgets/social_media_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding:EdgeInsets.only(left: 24.w, right: 24.w,top: 92.h, bottom: 58.h),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LogoWidget(),
                SizedBox(height: 32.h),
                Container(
                  width: 307.63.w,
                  child: Text(
                    'Welcome back! Glad to see you, Again!',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.w600,

        
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 32.h),
                Container(
                  width: 363.66.w,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter your email',
                      labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: const Color(0xFFBDBDBD),
                      ),

                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Container(
                  width: 363.66.w,
                  child: TextField(
                    obscureText: isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Enter your password',
                      labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: const Color(0xFFBDBDBD),
                        fontWeight: FontWeight.w400,
                      ),
                      suffixIcon:GestureDetector(
                        onTap: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        child: Icon(
                        isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          color: const Color(0xFF6A707C),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Container(
                  width: double.infinity,
                  child: Text(
                    'Forgot Password?',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: const Color(0xFF6A707C),
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
                SizedBox(height: 80.h),
                Container(
                  width: 363.66.w,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle login action
                    },

                    child: Text(
                      'Login',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 48.h),
                Text(
                  "Or Login with",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 16.h),
                SocialMediaLogin(),
                SizedBox(height: 80.h),
                RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(

                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: 'Register Now',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Handle sign up action
                          },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
