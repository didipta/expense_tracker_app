import 'package:dartz/dartz.dart';
import 'package:expense_tracker_app/features/auth/domain/entities/user.dart';
import 'package:expense_tracker_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:expense_tracker_app/features/common/domain/entities/api_error.dart';
import 'package:expense_tracker_app/features/common/domain/entities/no_params.dart';
import 'package:expense_tracker_app/features/common/domain/use_cases/use_cases.dart';

class AuthLoginUseCase  implements UseCase<Either<ApiError,bool>, User>
{
  final AuthRepository authRepository;
  AuthLoginUseCase(this.authRepository);

  @override
  Future<Either<ApiError, bool>> call(User params) {

    return authRepository.login(params);

  }

}