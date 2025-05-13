part of 'question_and_answers_cubit.dart';

@freezed
class QuestionAndAnswersState<T> with _$QuestionAndAnswersState<T> {
  const factory QuestionAndAnswersState.initial() = Initial;
  const factory QuestionAndAnswersState.loading() = Loading;
  const factory QuestionAndAnswersState.success(T data) = Success<T>;
  const factory QuestionAndAnswersState.failure(String error) = Failure;
}