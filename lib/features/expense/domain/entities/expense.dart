class Expense {
  int? id;
  final String title;
  final int amount;
  final DateTime date;
  int? isSynced;

  Expense({
    this.id,
    required this.title,
    required this.amount,
    required this.date,
    this.isSynced = 0,
  });
}