import 'package:json_annotation/json_annotation.dart';

part 'add_material_response_model.g.dart';

@JsonSerializable()

class AddMaterialResponseModel {
  int? code;
  String? message;

  AddMaterialResponseModel({this.code, this.message});

  factory AddMaterialResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AddMaterialResponseModelFromJson(json);
}
 