import 'package:get_it/get_it.dart';

import '../../core/network/error_mapper/default_error_mapper.dart';
import '../../core/network/network_executor.dart';
import '../../core/services/connectivity_service.dart';
import '../../features/auth/data/datasources/auth_datasource.dart';
import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repositiry_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/auth_login_use_case.dart';
import '../../features/auth/domain/usecases/auth_register_use_case.dart';
import '../../features/expense/data/datasources/expense_datasource.dart';
import '../../features/expense/data/datasources/expense_local_data_sources.dart';
import '../../features/expense/data/datasources/expense_remote_data_sources.dart';
import '../../features/expense/data/repositories/expense_repository_impl.dart';
import '../../features/expense/domain/repositories/expense_repository.dart';
import '../../features/expense/domain/usecases/expense_add_use_case.dart';
import '../../features/expense/domain/usecases/expense_fetch_alll_use_case.dart';
import '../network_setup/set_up_dio.dart';

final GetIt serviceLocator = GetIt.instance;

/// Toggle between Local and Remote Expense Data Sources
final bool useLocal = ConnectivityService.isConnected ? false : true;

void setUpServiceLocator() {
  // 🔌 Network executor (used by Remote Data Sources)
  serviceLocator.registerSingleton(
    NetworkExecutor(
      dio: getDioInstance(),
      errorMapper: DefaultErrorMapper(onUnauthorized: () {}),
    ),
  );

  // ✅ Auth-related bindings
  serviceLocator.registerSingleton<AuthDataSource>(
    AuthRemoteDataSource(serviceLocator()),
  );

  serviceLocator.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(serviceLocator()),
  );

  serviceLocator.registerSingleton<AuthResgisterUseCase>(
    AuthResgisterUseCase(serviceLocator()),
  );

  serviceLocator.registerSingleton<AuthLoginUseCase>(
    AuthLoginUseCase(serviceLocator()),
  );

  // ✅ Expense-related data sources
  serviceLocator.registerSingleton<ExpenseLocalDataSources>(
    ExpenseLocalDataSources(),
  );

  serviceLocator.registerSingleton<ExpenseRemoteDataSource>(
    ExpenseRemoteDataSource(serviceLocator()),
  );

  // 🧠 Choose the appropriate ExpenseDataSource based on useLocal
  serviceLocator.registerSingleton<ExpenseDataSource>(
    useLocal
        ? serviceLocator<ExpenseLocalDataSources>()
        : serviceLocator<ExpenseRemoteDataSource>(),
  );

  // ✅ ExpenseRepository depends on the selected ExpenseDataSource
  serviceLocator.registerSingleton<ExpenseRepository>(
    ExpenseRepositoryImpl(
      expenseLocalDataSources: serviceLocator<ExpenseLocalDataSources>(),
      expenseRemoteDataSources: serviceLocator<ExpenseRemoteDataSource>(),
    ),
  );

  // ✅ Expense use cases
  serviceLocator.registerSingleton<ExpenseAddUseCase>(
    ExpenseAddUseCase(serviceLocator()),
  );

  serviceLocator.registerSingleton<ExpenseFetchAllUseCase>(
    ExpenseFetchAllUseCase(serviceLocator()),
  );
}
