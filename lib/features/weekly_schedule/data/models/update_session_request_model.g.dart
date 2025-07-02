// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_session_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateSessionRequestModel _$UpdateSessionRequestModelFromJson(
        Map<String, dynamic> json) =>
    UpdateSessionRequestModel(
      day: json['day'] as String,
      date: json['date'] as String,
      from: json['from'] as String,
      to: json['to'] as String,
      attendance: json['attendance'] as String,
      hallId: (json['hall_id'] as num).toInt(),
    );

Map<String, dynamic> _$UpdateSessionRequestModelToJson(
        UpdateSessionRequestModel instance) =>
    <String, dynamic>{
      'day': instance.day,
      'date': instance.date,
      'from': instance.from,
      'to': instance.to,
      'attendance': instance.attendance,
      'hall_id': instance.hallId,
    };
