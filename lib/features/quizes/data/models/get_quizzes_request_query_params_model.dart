class GetQuizzesRequestQueryParamsModel {
  final String courseId;
  final String quizStatus;
  final String fromDate;

  GetQuizzesRequestQueryParamsModel(
      {required this.courseId,
      required this.quizStatus,
      required this.fromDate});
}
