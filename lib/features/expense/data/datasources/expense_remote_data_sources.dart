import 'package:dartz/dartz.dart';
import 'package:expense_tracker_app/features/common/domain/entities/api_error.dart';
import 'package:expense_tracker_app/features/expense/data/datasources/expense_datasource.dart';
import 'package:expense_tracker_app/features/expense/data/models/expense_model.dart';
import 'package:expense_tracker_app/features/expense/domain/entities/expense.dart';

import '../../../../core/network/models/network_resonse.dart';
import '../../../../core/network/models/request_model.dart';
import '../../../../core/network/network_executor.dart';

class ExpenseRemoteDataSource implements ExpenseDataSource {
  final NetworkExecutor networkExecutor;
  static const String _url_expense = "expenses";

  ExpenseRemoteDataSource(this.networkExecutor);

  @override
  Future<Either<ApiError, Expense>> addExpense(Expense expense) {
    print(expense.title);
    final Map<String, dynamic> formData = {
      "title": expense.title,
      "amount": expense.amount,
      "date": expense.date.toIso8601String()
    };

    return networkExecutor
        .postRequest(RequestModel(path: _url_expense, formData: formData))
        .then((NetworkResponse response) async {
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        final model = ExpenseModel.fromJson(data);
        return Right(model.toEntity());
      } else {
        return Left(ApiError(
          message: response.data?.toString() ?? "An error occurred",
          code: response.statusCode,
        ));
      }
    });
  }

  @override
  Future<Either<ApiError, List<Expense>>> fetchExpenses() {
    return networkExecutor
        .getRequest(RequestModel(path: _url_expense))
        .then((NetworkResponse response) async {
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final expenses = data
            .map((e) => ExpenseModel.fromJson(e).toEntity())
            .toList()
            .cast<Expense>();
        return Right(expenses);
      } else {
        return Left(ApiError(
          message: response.data?.toString() ?? "An error occurred",
          code: response.statusCode,
        ));
      }
    });
  }

  @override
  Future<Either<ApiError, Expense>> updateExpense(Expense expense) {
    final Map<String, dynamic> formData = {
      "title": expense.title,
      "amount": expense.amount,
      "date": expense.date.toIso8601String()
    };

    return networkExecutor
        .putRequest(RequestModel(path: '$_url_expense/${expense.id}', formData: formData))
        .then((NetworkResponse response) async {
      if (response.statusCode == 200) {
        final data = response.data;
        final model = ExpenseModel.fromJson(data);
        return Right(model.toEntity());
      } else {
        return Left(ApiError(
          message: response.data?.toString() ?? "An error occurred",
          code: response.statusCode,
        ));
      }
    });
  }

  @override
  Future<Either<ApiError, void>> deleteExpense(int id) {
    return networkExecutor
        .deleteRequest(RequestModel(path: '$_url_expense/$id'))
        .then((NetworkResponse response) async {
      if (response.statusCode == 200 || response.statusCode == 204) {
        return const Right(null);
      } else {
        return Left(ApiError(
          message: response.data?.toString() ?? "An error occurred",
          code: response.statusCode,
        ));
      }
    });
  }
}
