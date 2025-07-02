import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  int? code;
  String? message;
  List<UserData>? data;

  LoginResponseModel({this.code, this.message, this.data});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}

@JsonSerializable()
class UserData {
  @JsonKey(name: 'access_token')
  String? accessToken;

  @JsonKey(name: 'token_type')
  String? tokenType;

  User? user;

  UserData({this.accessToken, this.tokenType, this.user});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

@JsonSerializable()
class User {
  int? id;
  String? name;
  String? email;

  @JsonKey(name: 'created_at')
  String? createdAt;

  @JsonKey(name: 'updated_at')
  String? updatedAt;

  String? type;
  String? avatar;
  @JsonKey(name: 'uni_code')
  String? uniCode;
  User({
    this.id,
    this.name,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.type,
    this.avatar,
    this.uniCode,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
