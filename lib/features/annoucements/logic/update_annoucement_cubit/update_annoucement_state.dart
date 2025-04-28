part of 'update_annoucement_cubit.dart';

@freezed
class UpdateAnnoucementState<T> with _$UpdateAnnoucementState {
  const factory UpdateAnnoucementState.initial() = _Initial;
  const factory UpdateAnnoucementState.updateAnnoucementLoading() =
      UpdateAnnoucementLoading;
  const factory UpdateAnnoucementState.updateAnnoucementSuccess(T data) =
      UpdateAnnoucementSuccess<T>;
  const factory UpdateAnnoucementState.updateAnnoucementFailure(String error) =
      UpdateAnnoucementFailure;
  const factory UpdateAnnoucementState.selected({
    required CourseResponse selectedCourse,
    required String selectedCourseText,
  }) = UpdateAnnoucementSelected;
}
