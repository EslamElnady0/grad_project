import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_assignment_state.freezed.dart';

@freezed
class CreateAssignmentState<T> with _$CreateAssignmentState {
  const factory CreateAssignmentState.initial() = _Initial;
  const factory CreateAssignmentState.createAssignmentLoading() =
      CreateAssignmentLoading;
  const factory CreateAssignmentState.createAssignmentSuccess(T data) =
      CreateAssignmentSuccess<T>;
  const factory CreateAssignmentState.createAssignmentFailure(String error) =
      CreateAssignmentFailure;
  const factory CreateAssignmentState.selected() = CreateAssignmentSelected;

  const factory CreateAssignmentState.selectedDegree(String date) =
      CreateAssignmentSelectedDegree;

      const factory CreateAssignmentState.selectedTime(String date) =
      CreateAssignmentSelectedTime;
      const factory CreateAssignmentState.selectedDate(String date) =
      CreateAssignmentSelectedDate;
}
