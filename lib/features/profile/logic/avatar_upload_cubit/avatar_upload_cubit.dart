import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/profile/logic/avatar_upload_cubit/avatar_upload_state.dart';
import 'package:image_picker/image_picker.dart';

class AvatarUploadCubit extends Cubit<AvatarUploadState> {
  AvatarUploadCubit() : super(const AvatarUploadState.initial());

  final ImagePicker _picker = ImagePicker();

  Future<void> uploadAvatar() async {
    emit(const AvatarUploadState.uploading());
    try {
      final pickedAvatar = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedAvatar != null) {
        final image = File(pickedAvatar.path);
        emit(AvatarUploadState.uploadSuccess(image));
      } else {
        emit(const AvatarUploadState.uploadFailure('No image selected'));
      }
    } catch (e) {
      emit(AvatarUploadState.uploadFailure(e.toString()));
    }
  }

  void removeAvatar() {
    emit(const AvatarUploadState.initial());
  }
}
