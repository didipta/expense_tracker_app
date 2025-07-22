import 'package:expense_tracker_app/features/expense/domain/entities/expense.dart';
import 'package:expense_tracker_app/features/home/presentation/widgets/transaction_item.dart';
import 'package:flutter/cupertino.dart';

import '../../../expense/domain/entities/transaction.dart';

class TransactionListWidget extends StatelessWidget {
  final List<Expense> transactionList;
  const TransactionListWidget({super.key, required this.transactionList});

  @override
  Widget build(BuildContext context) {


    return ListView.builder(
      padding: EdgeInsets.zero, // Remove default padding
      physics: const NeverScrollableScrollPhysics(), // Disable its own scrolling
      shrinkWrap: true, // Make it take only the needed height
      itemCount: transactionList.length,
      itemBuilder: (context, index) {
        final transaction = transactionList[index];
        return TransactionItem(transaction: transaction);
      },
    );
  }
}
