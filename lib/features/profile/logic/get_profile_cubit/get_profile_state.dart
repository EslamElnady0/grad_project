
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_profile_state.freezed.dart';
@freezed
class GetProfileState<T> with _$GetProfileState{


  const factory GetProfileState.initial() = _Initial;
  const factory GetProfileState.getProfileLoading() = GetProfileLoading;
  const factory GetProfileState.getProfileSuccess(T data) = GetProfileSuccess<T>;
  const factory GetProfileState.getProfileFailure(String error) = GetProfileFailure;
}
