import 'package:flutter/material.dart';
import 'package:grad_project/features/forum/data/models/time_info.dart';
import 'package:grad_project/generated/l10n.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

TimeInfo getTimeInfo(BuildContext context, String? createdAtString) {
  final locale = Localizations.localeOf(context).languageCode;
  DateTime? createdAt;
  String from;
  String date;

  if (createdAtString != null) {
    createdAt = DateTime.tryParse(createdAtString);
    if (createdAt != null) {
      from = timeago.format(createdAt, locale: locale);
      date = DateFormat('dd/MM/yyyy', locale).format(createdAt);
    } else {
      from = S.of(context).unknown;
      date = S.of(context).unknown;
    }
  } else {
    from = S.of(context).unknown;
    date = S.of(context).unknown;
  }

  return TimeInfo(from: from, date: date);
}
