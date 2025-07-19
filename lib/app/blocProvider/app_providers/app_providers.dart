import 'package:expense_tracker_app/app/serviceLocator/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/localization/blocs/language_selector_cubit.dart';
import '../../../features/auth/presentation/blocs/auth_bloc.dart';

class AppProviders {
  static List<BlocProvider> get all => [
    BlocProvider<LanguageSelectorCubit>(
      create: (context) => LanguageSelectorCubit(),
    ),
    BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(
        serviceLocator()
      )
    ),
  ];
}