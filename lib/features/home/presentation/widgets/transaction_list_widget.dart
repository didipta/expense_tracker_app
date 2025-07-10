import 'package:expense_tracker_app/features/home/presentation/widgets/transaction_item.dart';
import 'package:flutter/cupertino.dart';

import '../../../auth/domain/entities/transaction.dart';

class TransactionListWidget extends StatelessWidget {
  const TransactionListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionList = [
      Transaction(title: 'Shopping', date: '12 Oct, 2023', amount: 500.00),
      Transaction(title: 'Grocery', date: '13 Oct, 2023', amount: -120.00),
      Transaction(title: 'Utilities', date: '14 Oct, 2023', amount: -75.50),
      Transaction(title: 'Dining Out', date: '15 Oct, 2023', amount: -45.00),
      Transaction(title: 'Salary', date: '16 Oct, 2023', amount: 2000.00),
      Transaction(title: 'Gym Membership', date: '17 Oct, 2023', amount: -30.00),
      Transaction(title: 'Online Course', date: '18 Oct, 2023', amount: -150.00),
      Transaction(title: 'Freelance Project', date: '19 Oct, 2023', amount: 800.00),
      Transaction(title: 'Coffee Shop', date: '20 Oct, 2023', amount: -10.00),
      Transaction(title: 'Book Purchase', date: '21 Oct, 2023', amount: -25.00),
    ];

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
