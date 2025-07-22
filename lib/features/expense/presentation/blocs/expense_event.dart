import '../../domain/entities/expense.dart';

abstract class ExpenseEvent {
}

class LoadExpensesEvent extends ExpenseEvent {}

class AddExpenseEvent extends ExpenseEvent {
  final Expense expense;

  AddExpenseEvent(this.expense);
}
