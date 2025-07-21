import 'package:dartz/dartz.dart';

import '../../../common/domain/entities/api_error.dart';
import '../../domain/entities/expense.dart';

abstract class ExpenseDataSource {
  Future<Either<ApiError, List<Expense>>> fetchExpenses();
  Future<Either<ApiError, Expense>> addExpense(Expense expense);
  Future<Either<ApiError, Expense>> updateExpense(Expense expense);
  Future<Either<ApiError, void>> deleteExpense(int id);
}