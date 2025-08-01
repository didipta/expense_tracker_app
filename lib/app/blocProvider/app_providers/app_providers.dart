import 'package:expense_tracker_app/app/serviceLocator/service_locator.dart';
import 'package:expense_tracker_app/features/expense/presentation/blocs/expense_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/auth/presentation/blocs/auth_bloc.dart';
import '../../../localization/blocs/language_selector_cubit.dart';

class AppProviders {
  static List<BlocProvider> get all =>
      [
        BlocProvider<LanguageSelectorCubit>(
          create: (context) => LanguageSelectorCubit(),
        ),
        BlocProvider<AuthBloc>(
            create: (context) =>
                AuthBloc(
                    serviceLocator(),
                    serviceLocator()
                )
        ),
        BlocProvider<ExpenseBloc>(
            create: (context) =>
                ExpenseBloc(
                    repository: serviceLocator()
                )
        ),
      ];
}
