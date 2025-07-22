String formatDateTime(DateTime dateTime) {
  final localDate = dateTime.toLocal();
  final formattedDate = localDate.toString().split(' ')[0].replaceAll('-', '/');
  final hour = localDate.hour;
  final minute = localDate.minute.toString().padLeft(2, '0');
  return '$formattedDate $hour:$minute';
}
