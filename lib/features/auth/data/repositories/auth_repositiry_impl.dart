import 'package:dartz/dartz.dart';
import 'package:expense_tracker_app/features/auth/data/datasources/auth_datasource.dart';
import '../../../common/domain/entities/api_error.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl(this.authDataSource);

  @override
  Future<Either<ApiError, bool>> login(User user) async {
   final response = await authDataSource.login(user);
   return response.fold((apiError) {
     return Left(apiError);
   }, (isSuccess) {
     return Right(isSuccess);
   });
  }

  @override
  Future<Either<ApiError, bool>> logout() async {
    final response = await authDataSource.logout();
    return response.fold((apiError) {
      return Left(apiError);
    }, (isSuccess) {
      return Right(isSuccess);
    });
  }

  @override
  Future<Either<ApiError, bool>> register(User user) async {
    final response = await authDataSource.register(user);
    return response.fold((apiError) {
      return Left(apiError);
    }, (isSuccess) {
      return Right(isSuccess);
    });
  }




}