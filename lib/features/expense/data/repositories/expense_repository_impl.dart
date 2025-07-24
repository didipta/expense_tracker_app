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
  Future<Either<ApiError, void>> deleteExpense(int id) async {
    // 1. Delete locally
    final localResult = await expenseLocalDataSources.deleteExpense(id);

    // 2. If local deletion fails, return immediately
    if (localResult.isLeft()) return localResult;

    // 3. If connected, also delete remotely
    if (ConnectivityService.isConnected) {
      final remoteResult = await expenseRemoteDataSources.deleteExpense(id);

      // If remote deletion fails, return that error, but local deletion already succeeded
      return remoteResult.fold(
            (error) => Left(error),
            (_) => const Right(null),
      );
    }

    // 4. Return success if local delete succeeded and we're offline
    return const Right(null);
  }


  @override
  Future<Either<ApiError, List<Expense>>> fetchExpenses() async {
    if (ConnectivityService.isConnected) {
     await syncLocalToServer();
      // Fetch from API
      final response = await expenseRemoteDataSources.fetchExpenses();

      return response.fold(
            (apiError) => Left(apiError),
            (apiExpenses) async {
          // Save only latest 10 API expenses to local DB
          final latest10 = apiExpenses.take(10).toList();

          // Optional: clear previous local cache (if desired)
          await expenseLocalDataSources.clearAllExpenses();

          for (final expense in latest10) {
            await expenseLocalDataSources.addExpense(
              Expense(
                id: expense.id,
                title: expense.title,
                amount: expense.amount,
                date: expense.date,
                isSynced:1

              )
            );
          }

          return Right(apiExpenses);
        },
      );
    } else {
      // Offline mode: return from local DB
      final localResponse = await expenseLocalDataSources.fetchExpenses();
      return localResponse;
    }
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

  Future<void> syncLocalToServer() async {
    // only if online
    if (!ConnectivityService.isConnected) return;

    final unsynced = await expenseLocalDataSources.getUnsyncedExpenses();
    for (final expense in unsynced) {
      final result = await expenseRemoteDataSources.addExpense(Expense(
        id: expense.id,
        title: expense.title,
        amount: expense.amount,
        date: expense.date,
      ));
      result.fold(
            (error) {
          // You may log it or retry later
          print('Sync failed for expense ${expense.id}: ${error.message}');
        },
            (_) async {
              print('Synced expense ${expense.id} to server');
              print(expense.isSynced);
          await expenseLocalDataSources.markExpenseAsSynced(expense.id!);
        },
      );
    }
  }

}