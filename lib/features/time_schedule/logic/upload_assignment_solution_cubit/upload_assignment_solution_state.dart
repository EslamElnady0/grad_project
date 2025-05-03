


import 'package:freezed_annotation/freezed_annotation.dart';
part 'upload_assignment_solution_state.freezed.dart';
@freezed
class UploadAssignmentSolutionState<T> with _$UploadAssignmentSolutionState {


  const factory UploadAssignmentSolutionState.initial() = _Initial;
  const factory UploadAssignmentSolutionState.uploadAssignmentSolutionLoading() =UploadAssignmentSolutionLoading;
  const factory UploadAssignmentSolutionState.uploadAssignmentSolutionSuccess(T data) = UploadAssignmentSolutionSuccess;
  const factory UploadAssignmentSolutionState.uploadAssignmentSolutionFailure(String error) = UploadAssignmentSolutionFailure;
}
