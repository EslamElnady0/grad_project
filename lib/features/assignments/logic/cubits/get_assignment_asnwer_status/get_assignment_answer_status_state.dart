import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_assignment_answer_status_state.freezed.dart';

@freezed
class GetAssignmentAnswerStatusState<T> with _$GetAssignmentAnswerStatusState {
  const factory GetAssignmentAnswerStatusState.initial() = _Initial;
  const factory GetAssignmentAnswerStatusState.loading() =
      GetAssignmentAnswerStatusLoading;
  const factory GetAssignmentAnswerStatusState.success(
      T data) = GetAssignmentAnswerStatusSuccess<T>;
  const factory GetAssignmentAnswerStatusState.failure(
      String error) = GetAssignmentAnswerStatusFailure;
}
