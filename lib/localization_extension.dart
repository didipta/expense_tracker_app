import 'package:flutter/material.dart';

import 'localization/l10n/app_localizations.dart';



extension LocalizationExtension on BuildContext {
  AppLocalizations get localization {
    return AppLocalizations.of(this);
  }
}