abstract class AuthEvent {}

class AuthRegisterRequested extends AuthEvent {
  final String fullName;
  final String email;
  final String password;

  AuthRegisterRequested({
    required this.fullName,
    required this.email,
    required this.password,
  });
}