import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LayoutBody extends StatelessWidget {
  final Widget appBar;
  final Widget child;

  const LayoutBody({super.key, required this.child, required this.appBar});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Background Image with Rounded Bottom
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 287.h,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('asset/layout.png'),
                    fit: BoxFit.cover,
                    alignment: Alignment.topRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.r),
                    bottomRight: Radius.circular(50.r),
                  ),
                ),
              ),
              // Positioned(
              //   top: 74.h,
              //   left: 0,
              //   right: 0,
              //   child: appBar,
              // ),
              Transform.translate(
                offset: Offset(0, 0.h), // negative top spacing
                child: Column(
                  children: [
                    SizedBox(height: 52.h),
                    appBar,
                    child,
                  ],
                ),
              ),
            ],
          ),

          // Main content below the header

        ],
      ),
    );
  }
}
