import 'package:expense_tracker_app/core/services/format_date_time.dart';
import 'package:expense_tracker_app/features/expense/domain/entities/expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../expense/presentation/blocs/expense_bloc.dart';
import '../../../expense/presentation/blocs/expense_event.dart';

class TransactionItem extends StatelessWidget {
  final Expense transaction;

  const TransactionItem({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // click action modal show and delete button show
        _buildTransactionDetailsModal(context);
      },
      child: Container(
        margin: EdgeInsets.only(bottom:20.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 50.w,
                  height: 50.w,
                  decoration: BoxDecoration(
                    color: Color(0xFFF0F6F5),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(
                    Icons.shopify,
                    color: Theme.of(context).primaryColor,
                    size: 34.w,
                  ),
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.title,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      formatDateTime(transaction.date),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Color(0xFF666666),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Text(
              '${transaction.amount > 0 ? '+' : '-'}\$${transaction.amount.abs().toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: transaction.amount > 0 ? Colors.green : Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _buildTransactionDetailsModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Theme.of(context).cardColor,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Center(
                child: Text(
                  'Transaction Details',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              _detailRow('Title:', transaction.title),
              _detailRow('Date:', formatDateTime(transaction.date)),
              _detailRow('Amount:', '\$${transaction.amount.toStringAsFixed(2)}'),
              SizedBox(height: 24.h),
              Center(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.delete),
                  label: const Text('Delete Transaction'),
                  onPressed: () async {
                    final confirmed = await showDialog<bool>(
                      context: context,
                      builder: (BuildContext dialogContext) {
                        return AlertDialog(
                          title: const Text('Confirm Deletion'),
                          content: const Text('Are you sure you want to delete this transaction?'),
                          actions: [
                            TextButton(
                              child: const Text('No'),
                              onPressed: () => Navigator.pop(dialogContext, false),
                            ),
                            TextButton(
                              child: const Text('Yes'),
                              onPressed: () =>  {
                                context.read<ExpenseBloc>().add((DeleteExpenseEvent(
                                    int.parse(transaction.id.toString())
                                )) ),
                                Navigator.pop(dialogContext, true)
                              }
                            ),
                          ],
                        );
                      },
                    );

                    if (confirmed == true) {
                      // Call delete logic here
                      Navigator.pop(context); // Close bottom sheet
                      // Optionally: show toast or update UI
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );

  }

  Widget _detailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        children: [
          Text(
            '$label ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

}
