
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_assignments_answers_state.freezed.dart';
@freezed
class GetAssignmentsAnswersState<T> with _$GetAssignmentsAnswersState {


  const factory GetAssignmentsAnswersState.initial() = _Initial;
  const factory GetAssignmentsAnswersState.getAssignmentsAnswersLoading() = GetAssignmentsAnswersLoading;
  const factory GetAssignmentsAnswersState.getAssignmentsAnswersSuccess(T data) = GetAssignmentsAnswersSuccess<T>;
  const factory GetAssignmentsAnswersState.getAssignmentsAnswersFailure(String error) = GetAssignmentsAnswersFailure;
}
