import 'package:dartz/dartz.dart';
import 'package:expense_tracker_app/features/auth/domain/entities/user.dart';
import 'package:expense_tracker_app/features/common/domain/entities/api_error.dart';
import 'package:expense_tracker_app/features/common/domain/use_cases/use_cases.dart';

import '../repositories/auth_repository.dart';

class AuthResgisterUseCase  implements UseCase<Either<ApiError,bool>,User>{

  final AuthRepository authRepository;

  AuthResgisterUseCase(this.authRepository);
  @override
  Future<Either<ApiError, bool>> call(User params) {
    return authRepository.register(params);
  }

}