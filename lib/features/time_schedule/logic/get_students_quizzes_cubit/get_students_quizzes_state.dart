
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_students_quizzes_state.freezed.dart';
@freezed
class GetStudentsQuizzesState<T> with _$GetStudentsQuizzesState {
  const factory GetStudentsQuizzesState.initial() = _Initial;
  const factory GetStudentsQuizzesState.getStudentsQuizzesLoading() = GetStudentsQuizzesLoading;
  const factory GetStudentsQuizzesState.getStudentsQuizzesSuccess(T data) = GetStudentsQuizzesSuccess<T>;
  const factory GetStudentsQuizzesState.getStudentsQuizzesFailure(String error) = GetStudentsQuizzesFailure;
}