part of 'delete_quiz_cubit.dart';
@freezed
class DeleteQuizState<T> with _$DeleteQuizState {
  const factory DeleteQuizState.initial() = _Initial;
  const factory DeleteQuizState.deleteQuizLoading() = DeleteQuizLoading;
  const factory DeleteQuizState.deleteQuizSuccess(T data) = DeleteQuizSuccess<T>;
  const factory DeleteQuizState.deleteQuizFailure(String error) = DeleteQuizFailure;
}
