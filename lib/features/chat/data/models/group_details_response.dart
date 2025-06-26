import 'package:json_annotation/json_annotation.dart';

part 'group_details_response.g.dart';

@JsonSerializable()
class GroupDetailsResponse {
  final String message;
  final GroupData data;

  GroupDetailsResponse({required this.message, required this.data});

  factory GroupDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$GroupDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GroupDetailsResponseToJson(this);
}

@JsonSerializable()
class GroupData {
  final String name;
  final List<User> users;

  GroupData({required this.name, required this.users});

  factory GroupData.fromJson(Map<String, dynamic> json) =>
      _$GroupDataFromJson(json);

  Map<String, dynamic> toJson() => _$GroupDataToJson(this);
}

@JsonSerializable()
class User {
  final int userId;
  final bool isAdmin;

  User({required this.userId, required this.isAdmin});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
