import 'dart:io';

class EditAssignmentRequestModel {
  final int assignmentId;
  final int courseId;
  final String title;
  final String description;
  final String totalDegree;
  final String date;
  final String time;
  final File? file;

  EditAssignmentRequestModel({
    required this.assignmentId,
    required this.courseId,
    required this.title,
    required this.description,
    required this.totalDegree,
    required this.date,
    required this.time,
    this.file,
  });

}
