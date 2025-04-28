part of 'quizzes_cubit.dart';
@freezed
class QuizzesState<T> with _$QuizzesState {
  const factory QuizzesState.initial() = _Initial;
  const factory QuizzesState.quizzesLoading() = QuizzesLoading;
  const factory QuizzesState.quizzesSuccess(T data) = QuizzesSuccess<T>;
  const factory QuizzesState.quizzesFailure(String error) = QuizzesFailure;
}
