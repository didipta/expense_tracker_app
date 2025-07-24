import 'package:dartz/dartz.dart';
import 'package:expense_tracker_app/core/database/database_helper.dart';
import 'package:expense_tracker_app/features/common/domain/entities/api_error.dart';
import 'package:expense_tracker_app/features/expense/data/models/expense_model.dart';
import 'package:expense_tracker_app/features/expense/domain/entities/expense.dart';

import 'expense_datasource.dart';

class ExpenseLocalDataSources implements ExpenseDataSource {
  final String _table = 'expenses';
  final dbHelper = DatabaseHelper();

  ExpenseLocalDataSources() {
    // Register the expense table only once
    DatabaseHelper.registerTable(_table, (db) async {
      await db.execute('''
        CREATE TABLE $_table (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          amount INTEGER,
          date TEXT,
          isSynced INTEGER DEFAULT 0
        )
      ''');
    });
  }

  @override
  Future<Either<ApiError, Expense>> addExpense(Expense expense) async {
    try {
      final db = await dbHelper.database;
      final model = ExpenseModel(
        title: expense.title,
        amount: expense.amount,
        date: expense.date,
        isSynced: expense.isSynced, // Offline data is unsynced by default
      );
      final id = await db.insert(
        _table,
        model.toMap(withId: false),
      );
      return Right(
        Expense(
          id: id,
          title: model.title,
          amount: model.amount,
          date: model.date,
        ),
      );
    } catch (e) {
      return Left(ApiError(message: 'Failed to add expense: $e'));
    }
  }

  @override
  Future<Either<ApiError, void>> deleteExpense(int id) async {
    try {
      final db = await dbHelper.database;
      await db.delete(_table, where: 'id = ?', whereArgs: [id]);
      return const Right(null);
    } catch (e) {
      return Left(ApiError(message: 'Failed to delete expense: $e'));
    }
  }

  @override
  Future<Either<ApiError, List<Expense>>> fetchExpenses() async {
    try {
      final db = await dbHelper.database;
      final result = await db.query(_table);
      final expenses = result.map((e) => ExpenseModel.fromJson(e).toEntity()).toList();
      return Right(expenses);
    } catch (e) {
      return Left(ApiError(message: 'Failed to fetch expenses: $e'));
    }
  }

  @override
  Future<Either<ApiError, Expense>> updateExpense(Expense expense) async {
    try {
      final db = await dbHelper.database;
      final model = ExpenseModel(
        id: expense.id!,
        title: expense.title,
        amount: expense.amount,
        date: expense.date,
        isSynced: 0, // Mark as unsynced when updated locally
      );
      await db.update(
        _table,
        model.toMap(),
        where: 'id = ?',
        whereArgs: [model.id],
      );
      return Right(model.toEntity());
    } catch (e) {
      return Left(ApiError(message: 'Failed to update expense: $e'));
    }
  }

  //clearAllExpenses

  Future<void> clearAllExpenses() async {
    final db = await dbHelper.database;
    await db.delete(_table);
  }

  // ✅ Get all expenses where isSynced = 0
  Future<List<ExpenseModel>> getUnsyncedExpenses() async {
    final db = await dbHelper.database;
    final result = await db.query(
      _table,
      where: 'isSynced = ?',
      whereArgs: [0],
    );
    return result.map((e) => ExpenseModel.fromJson(e)).toList();
  }

  // ✅ Mark a specific expense as synced (after hitting API)
  Future<void> markExpenseAsSynced(int id) async {
    final db = await dbHelper.database;
    await db.update(
      _table,
      {'isSynced': 1},
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
