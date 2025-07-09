import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/material_color.dart';
import '../../../../shared/widgets/logo_widget.dart';
import '../widgets/social_media_login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

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
                    'Nice to meet you',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.w600,


                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 4.w,),
                Container(
                  width: 307.63.w,
                  child: Text(
                    'Before we begin, we need some details.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF564E60),

                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 32.h),
                Container(
                  width: 363.66.w,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Usernaame',
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
                      labelText: 'password',
                      labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: const Color(0xFFBDBDBD),
                        fontWeight: FontWeight.w400,
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
                      labelText: 'Confirm password',
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
                  width: 363.66.w,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle login action
                    },

                    child: Text(
                      'Register ',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Text(
                  "Or Register with",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 16.h),
                SocialMediaLogin(),
                SizedBox(height: 56.h),
                RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(

                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: 'Login Now',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                           context.go('/login');
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
