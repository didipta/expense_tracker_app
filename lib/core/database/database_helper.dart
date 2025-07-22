import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

typedef TableBuilder = Future<void> Function(Database db);

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;
  static final Map<String, TableBuilder> _tableBuilders = {};

  DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  /// Register table creation logic before database is initialized
  static void registerTable(String tableName, TableBuilder builder) {
    _tableBuilders[tableName] = builder;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    final path = join(await getDatabasesPath(), 'expense.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        for (final builder in _tableBuilders.values) {
          await builder(db);
        }
      },
    );
  }
}
