part of 'start_students_quiz_cubit.dart';
@freezed
class StartStudentsQuizState<T> with _$StartStudentsQuizState {
  const factory StartStudentsQuizState.initial() = _Initial;
  const factory StartStudentsQuizState.startStudentsQuizLoading() = StartStudentsQuizLoading;
  const factory StartStudentsQuizState.startStudentsQuizSuccess(T data) = StartStudentsQuizSuccess<T>;
  const factory StartStudentsQuizState.startStudentsQuizFailure(String error) = StartStudentsQuizFailure;
}
