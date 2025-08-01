import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageSelectorCubit extends Cubit<Locale> {
  LanguageSelectorCubit() : super(const Locale('en')) {
    initializeLocale(); // Automatically initialize
  }

  Future<void> changeLocale(Locale newLocale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', newLocale.languageCode);
    emit(newLocale);
  }

  Future<void> initializeLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final langCode = prefs.getString('locale') ?? 'bn';
    emit(Locale(langCode));
  }
}
