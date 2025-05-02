class GetAssignmentsRequestQueryParamsModel {
  final String courseId;
  final String assignmentStatus;
  final String fromDate;

  GetAssignmentsRequestQueryParamsModel(
      {required this.courseId,
      required this.assignmentStatus,
      required this.fromDate});
}
