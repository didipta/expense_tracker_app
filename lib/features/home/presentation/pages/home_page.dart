import 'package:expense_tracker_app/core/services/authlocalStorageService.dart';
import 'package:expense_tracker_app/features/home/presentation/widgets/greetingwidget.dart';
import 'package:expense_tracker_app/features/home/presentation/widgets/home_appbar_widget.dart';
import 'package:expense_tracker_app/features/home/presentation/widgets/home_total_balance_widget.dart';
import 'package:expense_tracker_app/features/home/presentation/widgets/transaction_list_widget.dart';
import 'package:expense_tracker_app/shared/widgets/layout_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../expense/presentation/blocs/expense_bloc.dart';
import '../../../expense/presentation/blocs/expense_event.dart';
import '../../../expense/presentation/blocs/expense_state.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _onRefresh();
    });
    // Simulate fetching user name
    _loadUserData();
  }

  Future<void> _onRefresh() async {
    await _loadUserData(); // reload user data
    context.read<ExpenseBloc>().add(LoadExpensesEvent()); // re-fetch expenses
  }

  Future<void> _loadUserData() async {
    final data = await Authlocalstorageservice.getAuthData();
    final user = data['user'];

    print("User Data: $user");

    setState(() {
      userName = user['fullName']; // Or 'email' or 'id' depending on your need
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBody(
        appBar: HomeAppbarWidget(userName: userName ?? 'User'),
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(), // Required for RefreshIndicator
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
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: Colors.black45),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    BlocBuilder<ExpenseBloc, ExpenseState>(
                      builder: (context, state) {
                        if (state is ExpenseLoading) {
                          return Center(child: CircularProgressIndicator());
                        } else if (state is ExpenseLoaded) {
                          return TransactionListWidget(
                            transactionList: state.expenses,
                          );
                        } else if (state is ExpenseError) {
                          return Center(child: Text('Error: ${state.message}'));
                        }
                        return SizedBox.shrink();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
