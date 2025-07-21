import 'package:dartz/dartz.dart';
import 'package:expense_tracker_app/features/common/domain/entities/no_params.dart';
import 'package:expense_tracker_app/features/common/domain/use_cases/use_cases.dart';

import '../../../common/domain/entities/api_error.dart';
import '../entities/expense.dart';
import '../repositories/expense_repository.dart';

class ExpenseFetchAllUseCase implements UseCase<Either<ApiError, List<Expense>>,NoParams>
{
  final ExpenseRepository expenseRepository;
  ExpenseFetchAllUseCase(this.expenseRepository);
  @override
  Future<Either<ApiError, List<Expense>>> call(NoParams params) {
    return expenseRepository.fetchExpenses();

  }
}