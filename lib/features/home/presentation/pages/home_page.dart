import 'package:expense_tracker_app/core/services/authlocalStorageService.dart';
import 'package:expense_tracker_app/features/home/presentation/widgets/greetingwidget.dart';
import 'package:expense_tracker_app/features/home/presentation/widgets/home_appbar_widget.dart';
import 'package:expense_tracker_app/features/home/presentation/widgets/home_total_balance_widget.dart';
import 'package:expense_tracker_app/features/home/presentation/widgets/transaction_list_widget.dart';
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
  String? userName;
  @override
  void initState() {
    super.initState();
    // Simulate fetching user name
   _loadUserData();
  }

  Future<void> _loadUserData() async {
    final data = await Authlocalstorageservice.getAuthData();
    final user = data['user'];

    setState(() {
      userName = user['fullName']; // Or 'email' or 'id' depending on your need
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBody(
        appBar: HomeAppbarWidget(
          userName: userName ?? 'User',
        ),
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            children: [
              HomeTotalBalanceWidget(),
              SizedBox(height: 20.h),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Transactions History',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(0, 0),
                        ),
                        onPressed: () {},
                        child: Text(
                          'See All',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: Colors.black45),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),

                  TransactionListWidget(),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
