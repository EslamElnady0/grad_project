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
}
