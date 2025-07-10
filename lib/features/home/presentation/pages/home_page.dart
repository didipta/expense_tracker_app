import 'package:expense_tracker_app/features/home/presentation/widgets/greetingwidget.dart';
import 'package:expense_tracker_app/features/home/presentation/widgets/home_appbar_widget.dart';
import 'package:expense_tracker_app/shared/widgets/layout_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBody(
        appBar: HomeAppbarWidget(),
          child:  Padding(
            padding: EdgeInsets.all(20.w),
            child: Container(
              width: 374.w,
              height: 202.h,
              margin: EdgeInsets.only(top: 155.h),
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
              child: Text(
                'Welcome to the Home Page',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
      ),
    );
  }
}

