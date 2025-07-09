import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/localization/blocs/language_selector_cubit.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({super.key});

  void _toggleLanguage(BuildContext context, Locale currentLocale) {
    final newLang = currentLocale.languageCode == 'en' ? 'bn' : 'en';
    context.read<LanguageSelectorCubit>().changeLocale(Locale(newLang));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<LanguageSelectorCubit, Locale>(
        builder: (context, state) {
          final currentLang = state.languageCode;
          return GestureDetector(
            onTap: () => _toggleLanguage(context, state),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                currentLang == 'en' ? 'Bn' : 'En',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          );
        },
      ),
    );
  }
}
