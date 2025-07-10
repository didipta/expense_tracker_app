import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LayoutBody extends StatelessWidget {
  final Widget appBar;
  final Widget child;

  const LayoutBody({super.key, required this.child, required this.appBar});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height, // Adjust height to fit the screen
        child: Stack(
          children: [
            // AppBar

            // Rounded Header Background
            Positioned(
              top: 0.h, // Push it up to only show the curved bottom
              left: -30.w,
              right: -30.w,
              child: Container(
                width: 414.w,
                height: 287.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('asset/layout.png'),
                    // Replace with your image path
                    fit: BoxFit.cover,
                    alignment:
                        Alignment.topRight, // Align the image to the bottom center
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80.r),
                    bottomRight: Radius.circular(80.r),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: 74.h,
              child: Column(
                children: [
                  appBar,
                  Flexible(child: child)
                ],
              ),
            ),
            // Positioned(
            //   top: 74.h,
            //   left: 0.w,
            //   right: 0.w,
            //   child: appBar, // The app bar widget
            // ),
            //
            // // Main Content
            // Positioned.fill(
            //     child: Padding(
            //       padding:EdgeInsets.only(
            //         top: 103.sp,
            //       ),
            //       child: SafeArea(child: child),
            //     )),
          ],
        ),
      ),
    );
  }
}
