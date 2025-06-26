part of 'quiz_details_cubit.dart';

@freezed
class QuizDetailsState with _$QuizDetailsState {
  const factory QuizDetailsState.initial() = _Initial;
  const factory QuizDetailsState.loading() = _Loading;
  const factory QuizDetailsState.success(QuizDetailsResponse data) = _Success;
  const factory QuizDetailsState.failure(String error) = _Failure;
}
