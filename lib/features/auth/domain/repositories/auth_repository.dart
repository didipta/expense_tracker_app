import 'package:dartz/dartz.dart';
import 'package:expense_tracker_app/features/auth/domain/entities/user.dart';

import '../../../common/domain/entities/api_error.dart';

abstract class AuthRepository {
  Future<Either<ApiError,bool>> login(User user);
  Future<Either<ApiError,bool>> register(User user);
  Future<Either<ApiError,bool>> logout();
}