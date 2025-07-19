import 'package:dartz/dartz.dart';
import 'package:expense_tracker_app/features/common/domain/entities/api_error.dart';
import 'package:expense_tracker_app/features/common/domain/use_cases/use_cases.dart';

import '../../../common/domain/entities/no_params.dart';
import '../repositories/auth_repository.dart';

class AuthLogoutUseCase implements UseCase<Either<ApiError,bool>, NoParams> {
  final AuthRepository authRepository;

  AuthLogoutUseCase(this.authRepository);

  @override
  Future<Either<ApiError, bool>> call(NoParams params) {
    return authRepository.logout();
  }
}