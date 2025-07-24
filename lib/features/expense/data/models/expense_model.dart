import '../../../common/data/models/base_model.dart';
import '../../domain/entities/expense.dart';

class ExpenseModel implements BaseModel<Expense>{
  int? id;
  final String title;
  final int amount;
  final DateTime date;
  int? isSynced;


  ExpenseModel({
    this.id,
    required this.title,
    required this.amount,
    required this.date,
    this.isSynced,
  });

  factory ExpenseModel.fromJson(Map<String, dynamic> json) {
    return ExpenseModel(
      id: json['id'] as int,
      title: json['title'] as String,
      amount: json['amount'] as int,
      date: DateTime.parse(json['date'] as String),
      isSynced: json['isSynced'] as int? ?? 0,
    );
  }

  // ✅ Convert to Map for DB
  Map<String, Object?> toMap({bool withId = true}) {
    final map = <String, Object?>{
      'title': title,
      'amount': amount,
      'date': date.toIso8601String(),
      'isSynced': isSynced ?? 0,
    };
    if (withId && id != null) {
      map['id'] = id;
    }
    return map;
  }

  @override
  Expense toEntity() {
    return Expense(
      id: id,
      title: title,
      amount: amount,
      date: date,
    );
  }

}