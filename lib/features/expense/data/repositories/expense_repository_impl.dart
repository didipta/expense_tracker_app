import 'package:dartz/dartz.dart';
import 'package:expense_tracker_app/core/services/connectivity_service.dart';
import 'package:expense_tracker_app/features/common/domain/entities/api_error.dart';
import 'package:expense_tracker_app/features/expense/data/datasources/expense_datasource.dart';
import 'package:expense_tracker_app/features/expense/data/datasources/expense_local_data_sources.dart';
import 'package:expense_tracker_app/features/expense/data/datasources/expense_remote_data_sources.dart';
import 'package:expense_tracker_app/features/expense/domain/entities/expense.dart';
import '../../domain/repositories/expense_repository.dart';

class ExpenseRepositoryImpl implements ExpenseRepository {
  final ExpenseLocalDataSources expenseLocalDataSources;
  final ExpenseRemoteDataSource expenseRemoteDataSources;
  ExpenseRepositoryImpl({
    required this.expenseLocalDataSources,
    required this.expenseRemoteDataSources,
  });

  ExpenseDataSource get _activeSource =>
      ConnectivityService.isConnected ? expenseRemoteDataSources : expenseLocalDataSources;
  @override
  Future<Either<ApiError, Expense>> addExpense(Expense expense) {

    return _activeSource.addExpense(expense).then((response) {
      return response.fold(
        (apiError) => Left(apiError),
        (expense) => Right(expense),
      );
    });
  }

  @override
  Future<Either<ApiError, void>> deleteExpense(int id) {
    return _activeSource.deleteExpense(id).then((response) {
      return response.fold(
        (apiError) => Left(apiError),
        (_) => const Right(null),
      );
    });
  }

  @override
  Future<Either<ApiError, List<Expense>>> fetchExpenses() {
    return _activeSource.fetchExpenses().then((response) {
      return response.fold(
        (apiError) => Left(apiError),
        (expenses) => Right(expenses),
      );
    });
  }

  @override
  Future<Either<ApiError, Expense>> updateExpense(Expense expense) {

    return _activeSource.updateExpense(expense).then((response) {
      return response.fold(
        (apiError) => Left(apiError),
        (expense) => Right(expense),
      );
    });
  }
}