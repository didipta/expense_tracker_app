class ApiError{
  final String message;
  final int? code;

  ApiError({
    required this.message,
    this.code,
  });

  @override
  String toString() {
    return 'ApiError{message: $message, code: $code}';
  }
}