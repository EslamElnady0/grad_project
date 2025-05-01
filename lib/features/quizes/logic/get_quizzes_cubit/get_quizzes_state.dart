part of 'get_quizzes_cubit.dart';
@freezed
class GetQuizzesState<T> with _$GetQuizzesState {
  const factory GetQuizzesState.initial() = _Initial;
  const factory GetQuizzesState.getQuizzesLoading() = GetQuizzesLoading;
  const factory GetQuizzesState.getQuizzesSuccess(T data) = GetQuizzesSuccess<T>;
  const factory GetQuizzesState.getQuizzesFailure(String error) = GetQuizzesFailure;
}
