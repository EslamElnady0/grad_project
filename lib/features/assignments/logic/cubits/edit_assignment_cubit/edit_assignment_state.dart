import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_assignment_state.freezed.dart';
@freezed
class EditAssignmentState<T> with _$EditAssignmentState {
  const factory EditAssignmentState.initial() = _Initial;
  const factory EditAssignmentState.editAssignmentLoading() =
      EditAssignmentLoading;
  const factory EditAssignmentState.editAssignmentSuccess(T data) =
      EditAssignmentSuccess<T>;
  const factory EditAssignmentState.editAssignmentFailure(String error) =
      EditAssignmentFailure;
  const factory EditAssignmentState.selected() = EditAssignmentSelected;
  const factory EditAssignmentState.selectedDegree(String date) =
      EditAssignmentSelectedDegree;
  const factory EditAssignmentState.selectedTime(String date) =
      EditAssignmentSelectedTime;
  const factory EditAssignmentState.selectedDate(String date) =
      EditAssignmentSelectedDate;
}