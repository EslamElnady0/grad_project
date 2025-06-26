

import 'package:freezed_annotation/freezed_annotation.dart';
part 'update_profile_state.freezed.dart';
@freezed
class UpdateProfileState<T> with _$UpdateProfileState {

  const factory UpdateProfileState.initial() = _Initial;
  const factory UpdateProfileState.updateProfileLoading() = UpdateProfileLoading;
  const factory UpdateProfileState.updateProfileSuccess(T data) = UpdateProfileSuccess<T>;
  const factory UpdateProfileState.updateProfileFailure(String error) = UpdateProfileFailure;

}