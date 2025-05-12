// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupDetailsResponse _$GroupDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    GroupDetailsResponse(
      message: json['message'] as String,
      data: GroupData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GroupDetailsResponseToJson(
        GroupDetailsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

GroupData _$GroupDataFromJson(Map<String, dynamic> json) => GroupData(
      name: json['name'] as String,
      users: (json['users'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GroupDataToJson(GroupData instance) => <String, dynamic>{
      'name': instance.name,
      'users': instance.users,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      userId: (json['userId'] as num).toInt(),
      isAdmin: json['isAdmin'] as bool,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userId': instance.userId,
      'isAdmin': instance.isAdmin,
    };
