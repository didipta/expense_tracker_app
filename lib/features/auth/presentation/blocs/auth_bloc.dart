import 'package:expense_tracker_app/features/auth/domain/entities/user.dart';
import 'package:expense_tracker_app/features/auth/presentation/blocs/auth_event.dart';
import 'package:expense_tracker_app/features/auth/presentation/blocs/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/auth_register_use_case.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthResgisterUseCase authResgisterUseCase;

  AuthBloc(this.authResgisterUseCase) : super(AuthInitial()) {
    on<AuthRegisterRequested>(_onRegister);
  }

  Future<void> _onRegister(
    AuthRegisterRequested event,
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
      (apiError) => emit(AuthFailure(apiError)),
      (isSuccess) => emit(AuthSuccess('Registration successful')),
    );
  }
}
