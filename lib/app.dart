import 'package:expense_tracker_app/core/localization/blocs/language_selector_cubit.dart';
import 'package:expense_tracker_app/core/localization/l10n/app_localizations.dart';
import 'package:expense_tracker_app/core/theme/theme_data.dart';
import 'package:expense_tracker_app/features/splash/presentation/pages/splash_page.dart';
import 'package:expense_tracker_app/routes/routers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpenseTrackerApp extends StatefulWidget {
  const ExpenseTrackerApp({super.key});

  @override
  State<ExpenseTrackerApp> createState() => _ExpenseTrackerAppState();
}

class _ExpenseTrackerAppState extends State<ExpenseTrackerApp> {
  // @override
  // void initState() {
  //   super.initState();
  //   FirebaseCrashlytics.instance.setUserIdentifier('rafat-meraz');
  //   FirebaseCrashlytics.instance.setCustomKey('UserId', 1230293);
  //   FirebaseCrashlytics.instance.log('Entered Home Screen');
  //
  //   FirebaseAnalytics.instance.setUserProperty(name: 'user-id', value: '342row8js');
  // }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 917),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => BlocProvider(
        create: (context) => LanguageSelectorCubit(),

        child: BlocBuilder<LanguageSelectorCubit,Locale>(
          builder: (context, selectedLocale) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Expense Tracker',
              theme: themeData,
              localizationsDelegates:AppLocalizations.localizationsDelegates,
                locale: selectedLocale,
                supportedLocales: AppLocalizations.supportedLocales,
              routerConfig: router,
              builder: (context, child) {
                return Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 412.w, // Set a maximum width for the app


                       // or any suitable value for large displays
                    ),
                    child: child!,
                  ),
                );
              },
            );
          }
        ),
      ),
    );
  }
}
