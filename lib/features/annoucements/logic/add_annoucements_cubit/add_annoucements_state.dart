part of 'add_annoucements_cubit.dart';

@freezed
class AddAnnoucementsState<T> with _$AddAnnoucementsState {
  const factory AddAnnoucementsState.initial() = _Initial;
  const factory AddAnnoucementsState.addAnnoucementsLoading() =
      AddAnnoucementsLoading;
  const factory AddAnnoucementsState.addAnnoucementsSuccess(T data) =
      AddAnnoucementsSuccess<T>;
  const factory AddAnnoucementsState.addAnnoucementsFailure(String error) =
      AddAnnoucementsFailure;
  const factory AddAnnoucementsState.selected() = AddAnnoucementsSelected;
}
