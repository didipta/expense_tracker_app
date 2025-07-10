import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 214.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Container(
            padding: EdgeInsets.only(left: 4.w, right: 4.w),
            color: Theme.of(context).colorScheme.primary,
            child: Text("Expense",style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            letterSpacing: 0.5,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onPrimary,
            )),
          ),
          SizedBox(width: 4.w),
          Container(
            child: Text(
              "Tracker",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                letterSpacing: 0.5,
                fontWeight: FontWeight.w600,
              )
            ),
          ),
        ],
      ),
    );
  }
}
