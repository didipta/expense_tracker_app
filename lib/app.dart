
import 'package:expense_tracker_app/core/localization/l10n/app_localizations.dart';
import 'package:expense_tracker_app/core/theme/theme_data.dart';
import 'package:expense_tracker_app/routes/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/blocProvider/app_providers/app_providers.dart';
import 'core/localization/blocs/language_selector_cubit.dart';

class ExpenseTrackerApp extends StatefulWidget {
  const ExpenseTrackerApp({super.key});

  @override
  State<ExpenseTrackerApp> createState() => _ExpenseTrackerAppState();
}

class _ExpenseTrackerAppState extends State<ExpenseTrackerApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 917),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MultiBlocProvider(
        providers: AppProviders.all,
        child: BlocBuilder<LanguageSelectorCubit, Locale>(
          builder: (context, selectedLocale) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Expense Tracker',
              theme: themeData,
              locale: selectedLocale,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              routerConfig: router,
              builder: (context, child) {
                return Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 412.w),
                    child: child!,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
