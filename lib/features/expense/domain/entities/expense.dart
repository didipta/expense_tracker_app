class Expense {
  int? id;
  final String title;
  final int amount;
  final DateTime date;

  Expense({
    this.id,
    required this.title,
    required this.amount,
    required this.date,
  });
}