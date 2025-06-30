part of 'filter_questions_cubit.dart';

@freezed
class FilterQuestionsState<T> with _$FilterQuestionsState {
  const factory FilterQuestionsState.initial() = _Initial;
  const factory FilterQuestionsState.filterQuestionsLoading() = FilterQuestionsLoading;
  const factory FilterQuestionsState.filterQuestionsSuccess(T data) = FilterQuestionsSuccess<T>;
  const factory FilterQuestionsState.filterQuestionsFailure(String error) = FilterQuestionsFailure;
}
