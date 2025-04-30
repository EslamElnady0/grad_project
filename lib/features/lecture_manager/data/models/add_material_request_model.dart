import 'dart:io';

class AddMaterialRequestModel {
  final String title;
  final int week;
  final String type;
  final List<File> material;

  AddMaterialRequestModel({
    required this.title,
    required this.week,
    required this.type,
    required this.material,
  });
}
