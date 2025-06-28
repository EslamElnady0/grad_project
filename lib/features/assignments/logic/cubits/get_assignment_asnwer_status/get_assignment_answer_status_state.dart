import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_assignment_answer_status_state.freezed.dart';

@freezed
class GetAssignmentAnswerStatusState<T> with _$GetAssignmentAnswerStatusState {
  const factory GetAssignmentAnswerStatusState.initial() = _Initial;
  const factory GetAssignmentAnswerStatusState.getAssignmentsAnswersLoading() =
      GetAssignmentAnswerStatusLoading;
  const factory GetAssignmentAnswerStatusState.getAssignmentsAnswersSuccess(
      T data) = GetAssignmentAnswerStatusSuccess<T>;
  const factory GetAssignmentAnswerStatusState.getAssignmentsAnswersFailure(
      String error) = GetAssignmentAnswerStatusFailure;
}
