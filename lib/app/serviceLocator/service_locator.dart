import 'package:expense_tracker_app/app/network_setup/set_up_dio.dart';
import 'package:expense_tracker_app/core/network/error_mapper/default_error_mapper.dart';
import 'package:expense_tracker_app/core/network/network_executor.dart';
import 'package:expense_tracker_app/features/auth/data/datasources/auth_datasource.dart';
import 'package:expense_tracker_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:expense_tracker_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:expense_tracker_app/features/auth/domain/usecases/auth_login_use_case.dart';
import 'package:expense_tracker_app/features/auth/domain/usecases/auth_register_use_case.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repositories/auth_repositiry_impl.dart';

final GetIt serviceLocator = GetIt.instance;

void setUpServiceLocator(){
  serviceLocator.registerSingleton(
    NetworkExecutor(dio: getDioInstance(), errorMapper: DefaultErrorMapper(onUnauthorized: (){})),
  );

  serviceLocator.registerSingleton<AuthDataSource>(
    AuthRemoteDataSource(serviceLocator())
  );

  serviceLocator.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(serviceLocator())
  );


  serviceLocator.registerSingleton<AuthResgisterUseCase>(
    AuthResgisterUseCase(serviceLocator())
  );

  serviceLocator.registerSingleton<AuthLoginUseCase>(
    AuthLoginUseCase(serviceLocator())
  );

}