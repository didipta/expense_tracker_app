import 'package:dartz/dartz.dart';
import 'package:expense_tracker_app/features/common/domain/entities/api_error.dart';

import '../../domain/entities/user.dart';

abstract class AuthDataSource {
  Future<Either<ApiError,bool>> login(User user);
  Future<Either<ApiError,bool>> register(User user);
  Future<Either<ApiError,bool>> logout();
}