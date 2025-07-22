import 'package:bloc/bloc.dart';
import '../../domain/repositories/expense_repository.dart';
import 'expense_event.dart';
import 'expense_state.dart';


class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  final ExpenseRepository repository;

  ExpenseBloc({required this.repository}) : super(ExpenseInitial()) {
    on<LoadExpensesEvent>(_onLoadExpenses);
    on<AddExpenseEvent>(_onAddExpense);
  }

  Future<void> _onLoadExpenses(
      LoadExpensesEvent event, Emitter<ExpenseState> emit) async {
    emit(ExpenseLoading());
    final result = await repository.fetchExpenses();
    result.fold(
          (error) => emit(ExpenseError(
            message: error.message,
          )),
          (expenses) => emit(ExpenseLoaded(
            expenses: expenses,
          )),
    );
  }

  Future<void> _onAddExpense(
      AddExpenseEvent event, Emitter<ExpenseState> emit) async {
    emit(ExpenseLoading());
    final result = await repository.addExpense(event.expense);
    result.fold(
          (error) => emit(ExpenseError(
            message: error.message,
          )),
          (_) => add(LoadExpensesEvent()),
    );
  }
}
