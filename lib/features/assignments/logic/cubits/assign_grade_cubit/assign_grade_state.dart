import 'package:freezed_annotation/freezed_annotation.dart';
part 'assign_grade_state.freezed.dart';
@freezed
class AssignGradeState<T> with _$AssignGradeState {

  const factory AssignGradeState.initial() = _Initial<T>;

  const factory AssignGradeState.loading() = AssignGradeLoading;

  const factory AssignGradeState.success({
    required int answerId,
    required int newDegree,
    required T data,
  }) = AssignGradeSuccess<T>;

  const factory AssignGradeState.failure(String message) = AssignGradeFailure<T>;
}