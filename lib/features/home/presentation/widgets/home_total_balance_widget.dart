import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTotalBalanceWidget extends StatelessWidget {
  const HomeTotalBalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 374.w,
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 25.h,
      ),
      decoration: BoxDecoration(
        color: Color(0xFF65558F),
        borderRadius: BorderRadius.all(
            Radius.circular(20.r)
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 10), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Total Balance',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_up,
                        color: Colors.white,
                        size: 16.w,
                      )
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    '\$ 2,500.00',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Icon(
                Icons.more_horiz,
                color: Colors.white,
                size: 23.w,
              ),
            ],
          ),
          SizedBox(height: 30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 24.w,
                        height: 24.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.r),
                          color: Colors.white.withOpacity(0.1),

                        ),
                        child: Icon(Icons.arrow_downward,
                          color: Colors.white,
                          size: 18.w,
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        'Income',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Color(0xFFD0E5E4),
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    '\$ 2,500.00',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 24.w,
                        height: 24.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.r),
                          color: Colors.white.withOpacity(0.1),

                        ),
                        child: Icon(Icons.arrow_upward,
                          color: Colors.white,
                          size: 18.w,
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        'Expenses',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Color(0xFFD0E5E4),
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    '\$ 248.00',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
