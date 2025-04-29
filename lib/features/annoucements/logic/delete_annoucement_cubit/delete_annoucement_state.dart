part of 'delete_annoucement_cubit.dart';
@freezed
class DeleteAnnoucementState<T> with _$DeleteAnnoucementState {
  const factory DeleteAnnoucementState.initial() = _Initial;
  const factory DeleteAnnoucementState.deleteAnnoucementLoading() = DeleteAnnoucementLoading;
  const factory DeleteAnnoucementState.deleteAnnoucementSuccess(T data) = DeleteAnnoucementSuccess<T>;
  const factory DeleteAnnoucementState.deleteAnnoucementFailure(String error) = DeleteAnnoucementFailure;
}
