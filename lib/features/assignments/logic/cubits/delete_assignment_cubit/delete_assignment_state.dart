
import 'package:freezed_annotation/freezed_annotation.dart';
part 'delete_assignment_state.freezed.dart';
@freezed
class DeleteAssignmentState<T> with _$DeleteAssignmentState {

  const factory DeleteAssignmentState.initial() = _Initial<T>;

  const factory DeleteAssignmentState.loading() = _Loading<T>;

  const factory DeleteAssignmentState.success(T data) = _Success<T>;

  const factory DeleteAssignmentState.failure(String message) = _Failure<T>;
}
