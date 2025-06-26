import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/localizationa.dart';
import 'package:intl/intl.dart';

class FormatDateAndTimeHelpers {
  FormatDateAndTimeHelpers._();
  static String convertTo12HourFormat(String time24) {
    final parts = time24.split(':');
    if (parts.length != 2) {
      return time24; // Return original if format is invalid
    }
    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1]);

    final period = hour >= 12 ? 'PM' : 'AM';
    hour = hour % 12 == 0 ? 12 : hour % 12;

    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period';
  }

  static String formatDateToDayFullMonthAndYear(
      String dateString, BuildContext context) {
    final DateTime date = DateTime.parse(dateString);
    final DateFormat formatter =
        DateFormat('d MMMM yyyy', isArabicLocale(context) ? 'ar' : 'en');
    return formatter.format(date);
  }

  static DateTime parseDateAndTime(String date, String time) {
    final dateParts = date.split('-'); // [2025, 05, 10]
    final timeParts = time.split(':'); // [22, 00]

    return DateTime(
      int.parse(dateParts[0]), // year
      int.parse(dateParts[1]), // month
      int.parse(dateParts[2]), // day
      int.parse(timeParts[0]), // hour
      int.parse(timeParts[1]), // minute
    );
  }
}
