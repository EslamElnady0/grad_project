import 'package:json_annotation/json_annotation.dart';
part 'get_course_materials_response_model.g.dart';

@JsonSerializable()
class GetCourseMaterialsResponseModel {
  int? code;
  List<CourseMaterialData>? data;

  GetCourseMaterialsResponseModel({this.code, this.data});

  factory GetCourseMaterialsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetCourseMaterialsResponseModelFromJson(json);
}

@JsonSerializable()
class CourseMaterialData {
  int? id;
  String? title;
  String? week;
  String? file;
  String? type;
  @JsonKey(name: 'created_at') 
  String? createdAt;

  CourseMaterialData({
    this.id,
    this.title,
    this.week,
    this.file,
    this.type,
    this.createdAt,
  });

  factory CourseMaterialData.fromJson(Map<String, dynamic> json) =>
      _$CourseMaterialDataFromJson(json);
}