import 'dart:io';

class CreateAssignmentRequestModel {
  final int courseId;
  final String title;
  final String description;
  final String totalDegree;
  final String date;
  final String time;
  final File file;

  CreateAssignmentRequestModel(
      {required this.courseId,
      required this.title,
      required this.description,
      required this.totalDegree,
      required this.date,
      required this.time,
      required this.file});
}
