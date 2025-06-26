


import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_students_assignments_state.freezed.dart';
@freezed
class GetStudentsAssignmentsState<T> with _$GetStudentsAssignmentsState {
  const factory GetStudentsAssignmentsState.initial() = _Initial;
  const factory GetStudentsAssignmentsState.getStudentsAssignmentsLoading() = GetStudentsAssignmentsLoading;
  const factory GetStudentsAssignmentsState.getStudentsAssignmentsSuccess(T data) = GetStudentsAssignmentsSuccess<T>;
  const factory GetStudentsAssignmentsState.getStudentsAssignmentsFailure(String error) = GetStudentsAssignmentsFailure;
}