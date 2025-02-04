import 'package:flutter/material.dart';

bool isArabicLocale(BuildContext context) {
  Locale locale = Localizations.localeOf(context);
  return locale.languageCode == 'ar';
}