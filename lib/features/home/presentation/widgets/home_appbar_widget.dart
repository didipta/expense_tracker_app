import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'greetingwidget.dart';

class HomeAppbarWidget extends StatelessWidget {
  const HomeAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.only(left: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GreetingWidget(),
              SizedBox(height: 7.h),
              Text(
                'Dipta Saha',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),

            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 24.w),
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.67.r),
            color: Colors.white.withOpacity(0.1),

          ),
          child: Icon(Icons.notifications_none_outlined,
            color: Colors.white,
            size: 24.w,
          ),
        )
      ],
    );
  }
}
