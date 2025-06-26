import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_assignments_state.freezed.dart';

@freezed
class GetAssignmentsState<T> with _$GetAssignmentsState {
  const factory GetAssignmentsState.initial() = _Initial;
  const factory GetAssignmentsState.getAssignmentsLoading() = GetAssignmentsLoading;
  const factory GetAssignmentsState.getAssignmentsSuccess(T data) = GetAssignmentsSuccess<T>;
  const factory GetAssignmentsState.getAssignmentsFailure(String error) = GetAssignmentsFailure;
}

