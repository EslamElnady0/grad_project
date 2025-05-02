part of 'update_quiz_cubit.dart';
@freezed
class UpdateQuizState<T> with _$UpdateQuizState {
  const factory UpdateQuizState.initial() = _Initial;
  const factory UpdateQuizState.updateQuizLoading() = UpdateQuizLoading;
  const factory UpdateQuizState.updateQuizSuccess(T data) = UpdateQuizSuccess<T>;
  const factory UpdateQuizState.updateQuizFailure(String error) = UpdateQuizFailure;
}
