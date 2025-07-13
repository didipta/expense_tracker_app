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
                width: 414.w,
                height: 287.h,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('asset/layout.png'),
                    fit: BoxFit.fill,
                    alignment: Alignment.topRight,
                  ),

                ),
                child: Container(
                  width: 267.w,
                  height: 219.h,
                  child:Image(
                    image: AssetImage('asset/roundshap.png'),
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.topLeft,

                  ),
                ),
              ),

              Transform.translate(
                offset: Offset(0, 0.h), // negative top spacing
                child: Column(
                  children: [
                    SizedBox(height: 64.h),

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
