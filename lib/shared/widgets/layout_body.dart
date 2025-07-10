import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LayoutBody extends StatelessWidget {
  final Widget appBar;
  final Widget child;

  const LayoutBody({super.key, required this.child, required this.appBar});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // AppBar

        // Rounded Header Background
        Positioned(
          top: 0.h, // Push it up to only show the curved bottom
          left: -10.w,
          right: -10.w,
          child: Container(
            width: 414.w,
            height: 287.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('asset/layout.png'), // Replace with your image path
                fit: BoxFit.cover,
                alignment: Alignment.topRight, // Align the image to the bottom center
              ),
              borderRadius: BorderRadius.circular(40),

            ),
          ),
        ),
        Positioned(
          top: 74.h,
          left: 0.w,
          right: 0.w,
          child: appBar, // The app bar widget
        ),


        // Main Content
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              child, // The main content of the page
            ],
          ),
        ),
      ],
    );
  }
}
