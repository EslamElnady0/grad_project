import 'package:flutter/material.dart';

bool isArabicLocale(BuildContext context) {
  Locale locale = Localizations.localeOf(context);
  return locale.languageCode == 'ar';
}


 List<String> getLocalizedWeekNames(List<int> weekNumbers, BuildContext context) {
  final arNumbers = [
    'الأول', 'الثاني', 'الثالث', 'الرابع', 'الخامس',
    'السادس', 'السابع', 'الثامن', 'التاسع', 'العاشر',
    'الحادي عشر', 'الثاني عشر', 'الثالث عشر', 'الرابع عشر',
    'الخامس عشر', 'السادس عشر', 'السابع عشر', 'الثامن عشر',
    'التاسع عشر', 'العشرون'
  ];

  final enNumbers = [
    'One', 'Two', 'Three', 'Four', 'Five',
    'Six', 'Seven', 'Eight', 'Nine', 'Ten',
    'Eleven', 'Twelve', 'Thirteen', 'Fourteen',
    'Fifteen', 'Sixteen', 'Seventeen', 'Eighteen',
    'Nineteen', 'Twenty'
  ];

  return weekNumbers.map((week) {
    if (isArabicLocale(context) ) {
      if (week >= 1 && week <= arNumbers.length) {
        return 'الأسبوع ${arNumbers[week - 1]}';
      } else {
        return 'الأسبوع $week';
      }
    } else {
      if (week >= 1 && week <= enNumbers.length) {
        return 'Week ${enNumbers[week - 1]}';
      } else {
        return 'Week $week';
      }
    }
  }).toList();
}
