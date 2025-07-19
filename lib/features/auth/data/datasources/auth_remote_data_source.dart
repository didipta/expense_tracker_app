import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:expense_tracker_app/core/network/models/network_resonse.dart';
import 'package:expense_tracker_app/core/network/models/request_model.dart';
import 'package:expense_tracker_app/core/network/network_executor.dart';
import 'package:expense_tracker_app/core/services/authlocalStorageService.dart';
import 'package:expense_tracker_app/features/auth/data/datasources/auth_datasource.dart';
import 'package:expense_tracker_app/features/common/domain/entities/api_error.dart';

import '../../domain/entities/user.dart';

class AuthRemoteDataSource implements AuthDataSource
{
  final NetworkExecutor networkExecutor;
  AuthRemoteDataSource(this.networkExecutor);

  final String _url = "auth/sign-up";
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
  Future<Either<ApiError, bool>> register(User user) async {
    final Map<String, dynamic> formData ={
      "fullName": user.fullName,
      "email": user.email,
      "password": user.password,
    };
    final NetworkResponse response= await networkExecutor.postRequest(
      RequestModel(path: _url, formData: formData),
    );

    if( response.statusCode == 200 || response.statusCode == 201) {
      await Authlocalstorageservice.saveAuthData(response.data);
      return Right(true);
    } else {
      return Left(ApiError(
        message: response.data ?? "An error occurred",
        code: response.statusCode,
      ));
    }
  }
  
}