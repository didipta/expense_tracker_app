import 'package:dartz/dartz.dart';
import 'package:expense_tracker_app/features/auth/data/datasources/auth_datasource.dart';
import 'package:expense_tracker_app/features/common/domain/entities/api_error.dart';

import '../../domain/entities/user.dart';

class AuthRemoteDataSource implements AuthDataSource
{
  @override
  Future<Either<ApiError, bool>> login(User user) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<ApiError, bool>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<ApiError, bool>> register(User user) {
    // TODO: implement register
    throw UnimplementedError();
  }
  
}