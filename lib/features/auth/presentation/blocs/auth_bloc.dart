import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/auth_login_use_case.dart';
import '../../domain/usecases/auth_register_use_case.dart';
import '../../domain/entities/user.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthResgisterUseCase authResgisterUseCase;
  final AuthLoginUseCase authLoginUseCase;

  AuthBloc(this.authResgisterUseCase, this.authLoginUseCase) : super(AuthInitial()) {
    on<RegisterRequested>(_onRegister);
    on<LoginRequested>(_onLogin);
  }

  Future<void> _onRegister(
      RegisterRequested event,
      Emitter<AuthState> emit,
      ) async {
    emit(AuthLoading());
    final user = User(
      fullName: event.fullName,
      email: event.email,
      password: event.password,
    );
    final response = await authResgisterUseCase(user);

    response.fold(
          (error) => emit(AuthFailure(error)),
          (_) => emit(AuthSuccess('Registration successful')),
    );
  }

  Future<void> _onLogin(
      LoginRequested event,
      Emitter<AuthState> emit,
      ) async {
    emit(AuthLoading());
    final user = User(
      fullName: '', // Not needed for login
      email: event.email,
      password: event.password,
    );
    final response = await authLoginUseCase(user);

    response.fold(
          (error) => emit(AuthFailure(error)),
          (_) => emit(AuthSuccess('Login successful')),
    );
  }
}
