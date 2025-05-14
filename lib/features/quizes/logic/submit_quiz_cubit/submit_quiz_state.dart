part of 'submit_quiz_cubit.dart';
@freezed
class SubmitQuizState<T> with _$SubmitQuizState {
  const factory SubmitQuizState.initial() = _Initial;
  const factory SubmitQuizState.submitQuizLoading() = SubmitQuizLoading;
  const factory SubmitQuizState.submitQuizSuccess(T data) = SubmitQuizSuccess<T>;
  const factory SubmitQuizState.submitQuizFailure(String error) = SubmitQuizFailure;
}
