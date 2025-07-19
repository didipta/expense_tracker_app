import 'package:expense_tracker_app/features/common/domain/entities/api_error.dart';

abstract class AuthState {
}

class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthSuccess extends AuthState {
  final String message;

  AuthSuccess(this.message);
}
class AuthFailure extends AuthState {
  final ApiError error;

  AuthFailure(this.error);
}

class AuthLoggedIn extends AuthState {
  final String userId;
  final String token;

  AuthLoggedIn({required this.userId, required this.token});
}