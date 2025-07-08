import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialMediaLogin extends StatefulWidget {
  const SocialMediaLogin({super.key});

  @override
  State<SocialMediaLogin> createState() => _SocialMediaLoginState();
}

class _SocialMediaLoginState extends State<SocialMediaLogin> {
  void _onGoogleTap() {
    print("Google Login Clicked");
  }

  void _onFacebookTap() {
    print("Facebook Login Clicked");
  }

  void _onAppleTap() {
    print("Apple Login Clicked");
  }

  Widget _buildSocialButton({
    required String imagePath,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 115.36.w,
        height: 61.53.h,
        padding: EdgeInsets.symmetric(vertical: 16.48.h),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFE8DEF8),
            width: 1.15.w,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Image.asset(
            imagePath,
            width: 28.57.w,
            height: 28.57.h,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildSocialButton(
            imagePath: 'asset/Facebook.png',
            onTap: _onFacebookTap,
          ),
          SizedBox(width: 8.w),
          _buildSocialButton(
            imagePath: 'asset/Google.png',
            onTap: _onGoogleTap,
          ),
          SizedBox(width: 8.w),

          _buildSocialButton(
            imagePath: 'asset/apple.png',
            onTap: _onAppleTap,
          ),
        ],
      ),
    );
  }
}
