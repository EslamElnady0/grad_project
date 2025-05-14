import 'package:freezed_annotation/freezed_annotation.dart';
part 'avatar_upload_state.freezed.dart';

@freezed
class AvatarUploadState<T> with _$AvatarUploadState {
  const factory AvatarUploadState.initial() = _Initial;
  const factory AvatarUploadState.uploading() = Uploading;
  const factory AvatarUploadState.uploadSuccess(T data) = UploadSuccess<T>;
  const factory AvatarUploadState.uploadFailure(String error) = UploadFailure;
}
