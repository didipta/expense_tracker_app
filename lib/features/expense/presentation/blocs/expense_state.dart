import '../../domain/entities/expense.dart';

abstract class ExpenseState{
}

class ExpenseInitial extends ExpenseState {}

class ExpenseLoading extends ExpenseState {}

class ExpenseAddedState extends ExpenseState {
  final String message;
  ExpenseAddedState({required this.message});
}

class ExpenseLoaded extends ExpenseState {
  final List<Expense> expenses;
  ExpenseLoaded({required this.expenses});
}

class ExpenseError extends ExpenseState {
  ExpenseError({required this.message});
  final String message;
}
