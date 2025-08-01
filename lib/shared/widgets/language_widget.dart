import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../localization/blocs/language_selector_cubit.dart';


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
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () => _toggleLanguage(context, state),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        currentLang == 'en' ? Icons.language : Icons.translate,
                          color: Color(0xFF666666), size: 24.0
                      ),
                      SizedBox(width: 16.w),
                      Text(
                        "Language (${currentLang.toUpperCase()})",
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 10),

                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      currentLang == 'en' ? 'Bn' : 'En',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
