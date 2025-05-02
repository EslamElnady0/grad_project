part of 'get_quiz_by_id_cubit.dart';

@freezed
class GetQuizByIdState<T> with _$GetQuizByIdState {
  const factory GetQuizByIdState.initial() = _Initial;
  const factory GetQuizByIdState.getQuizByIdLoading() = GetQuizByIdLoading;
  const factory GetQuizByIdState.getQuizByIdSuccess(T data) =
      GetQuizByIdSuccess<T>;
  const factory GetQuizByIdState.getQuizByIdFailure(String error) =
      GetQuizByIdFailure;
}
