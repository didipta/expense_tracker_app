import 'package:dartz/dartz.dart';
import 'package:expense_tracker_app/features/common/domain/use_cases/use_cases.dart';
import 'package:expense_tracker_app/features/expense/domain/entities/expense.dart';
import 'package:expense_tracker_app/features/expense/domain/repositories/expense_repository.dart';

import '../../../common/domain/entities/api_error.dart';

class ExpenseAddUseCase  implements UseCase<Either<ApiError,Expense>,Expense>
{
  final ExpenseRepository expenseRepository;
  ExpenseAddUseCase(this.expenseRepository);
  @override
  Future<Either<ApiError, Expense>> call(Expense params) {
    return expenseRepository.addExpense(params);

  }

}