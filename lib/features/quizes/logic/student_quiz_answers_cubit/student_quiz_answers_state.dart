part of 'student_quiz_answers_cubit.dart';

@freezed
class StudentQuizAnswersState with _$StudentQuizAnswersState {
  const factory StudentQuizAnswersState.initial() = _Initial;
  const factory StudentQuizAnswersState.loading() = _Loading;
  const factory StudentQuizAnswersState.success(
      StudentQuizAnswersResponse data) = _Success;
  const factory StudentQuizAnswersState.failure(String error) = _Failure;
}
