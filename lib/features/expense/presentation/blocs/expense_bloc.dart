import 'package:bloc/bloc.dart';
import '../../domain/entities/expense.dart';
import '../../domain/repositories/expense_repository.dart';
import 'expense_event.dart';
import 'expense_state.dart';


class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  final ExpenseRepository repository;

  ExpenseBloc({required this.repository}) : super(ExpenseInitial()) {
    on<LoadExpensesEvent>(_onLoadExpenses);
    on<AddExpenseEvent>(_onAddExpense);
    on<DeleteExpenseEvent>(_onDeleteExpense);
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

  Future<void> _onDeleteExpense(
      DeleteExpenseEvent event,
      Emitter<ExpenseState> emit,
      ) async {
    final previousState = state;

    emit(ExpenseLoading());

    final result = await repository.deleteExpense(event.id);

    result.fold(
          (error) => emit(ExpenseError(message: error.message)),
          (_) {

        if (previousState is ExpenseLoaded) {
          final updatedExpenses = previousState.expenses
              .where((expense) => expense.id != event.id)
              .toList();
          emit(ExpenseLoaded(expenses: updatedExpenses));
        } else {
          emit(ExpenseAddedState(message: 'Expense deleted successfully'));
        }
      },
    );
  }

  Future<void> _onAddExpense(
      AddExpenseEvent event,
      Emitter<ExpenseState> emit,
      ) async {
    emit(ExpenseLoading());

    final result = await repository.addExpense(event.expense);

    result.fold(
          (error) => emit(ExpenseError(message: error.message)),
          (addedExpense) {
        final currentState = state;
        if (currentState is ExpenseLoaded) {
          final updatedExpenses = List<Expense>.from(currentState.expenses)
            ..add(addedExpense);
          emit(ExpenseLoaded(expenses: updatedExpenses));
        } else {
          emit(ExpenseAddedState(message: 'Expense added successfully'));
        }
      },
    );
  }

}
