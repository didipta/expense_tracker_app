import 'package:dartz/dartz.dart';
import 'package:expense_tracker_app/features/common/domain/entities/api_error.dart';
import 'package:expense_tracker_app/features/expense/data/datasources/expense_datasource.dart';
import 'package:expense_tracker_app/features/expense/domain/entities/expense.dart';

import '../../../../core/network/network_executor.dart';

class ExpenseRemoteDataSource implements ExpenseDataSource{
  final NetworkExecutor networkExecutor;

  ExpenseRemoteDataSource(this.networkExecutor);
  @override
  Future<Either<ApiError, Expense>> addExpense(Expense expense) {
    // TODO: implement addExpense
    throw UnimplementedError();
  }

  @override
  Future<Either<ApiError, void>> deleteExpense(int id) {
    // TODO: implement deleteExpense
    throw UnimplementedError();
  }

  @override
  Future<Either<ApiError, List<Expense>>> fetchExpenses() {
    // TODO: implement fetchExpenses
    throw UnimplementedError();
  }

  @override
  Future<Either<ApiError, Expense>> updateExpense(Expense expense) {
    // TODO: implement updateExpense
    throw UnimplementedError();
  }

}