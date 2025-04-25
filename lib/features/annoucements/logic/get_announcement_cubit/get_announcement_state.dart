part of 'get_announcement_cubit.dart';

@freezed
class GetAnnouncementState<T> with _$GetAnnouncementState {
  const factory GetAnnouncementState.initial() = _Initial;
  const factory GetAnnouncementState.getAnnouncementLoading() =
      GetAnnouncementLoading;
  const factory GetAnnouncementState.getAnnouncementSuccess(T data) =
      GetAnnouncementSuccess<T>;
  const factory GetAnnouncementState.getAnnouncementFailure(String error) =
      GetAnnouncementFailure;
}
