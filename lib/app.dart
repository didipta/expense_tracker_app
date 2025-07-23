
import 'package:expense_tracker_app/core/localization/l10n/app_localizations.dart';
import 'package:expense_tracker_app/core/theme/theme_data.dart';
import 'package:expense_tracker_app/routes/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/blocProvider/app_providers/app_providers.dart';
import 'app/network_setup/configurations.dart';
import 'core/localization/blocs/language_selector_cubit.dart';

class ExpenseTrackerApp extends StatefulWidget {
  const ExpenseTrackerApp({super.key});

  @override
  State<ExpenseTrackerApp> createState() => _ExpenseTrackerAppState();
}

class _ExpenseTrackerAppState extends State<ExpenseTrackerApp> {
  Future<void>? _initApp;

  @override
  void initState() {
    super.initState();
    _initApp = _initializeApp();
  }

  Future<void> _initializeApp() async {
    await Configurations.loadTokenFromStorage(); // ✅ Load token from SharedPreferences
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initApp,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Expense Tracker',
            theme:  ThemeData.light(),
            home: Scaffold(

              body: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        return ScreenUtilInit(
          designSize: const Size(412, 917),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, __) => MultiBlocProvider(
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
                  routerConfig: router, // ✅ At this point, token is already set
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
      },
    );
  }
}

