part of 'get_all_questions_cubit.dart';
@freezed
class GetAllQuestionsState<T> with _$GetAllQuestionsState {
  const factory GetAllQuestionsState.initial() = _Initial;
  const factory GetAllQuestionsState.getAllQuestionsLoading() = GetAllQuestionsLoading;
  const factory GetAllQuestionsState.getAllQuestionsSuccess(T data) = GetAllQuestionsSuccess<T>;
  const factory GetAllQuestionsState.getAllQuestionsFailure(String error) = GetAllQuestionsFailure;
}
