import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/flavors/flavors_functions.dart';
import 'package:grad_project/features/profile/data/repos/profile_repo.dart';
import 'package:grad_project/features/profile/logic/update_profile_cubit/update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final ProfileRepo _repo;
  UpdateProfileCubit(this._repo) : super(const UpdateProfileState.initial());

  TextEditingController passwordController = TextEditingController();
  File? avatar;

  Future<void> updateProfile() async {
    emit(const UpdateProfileState.updateProfileLoading());

    if (FlavorsFunctions.isStudent()) {
      final result =
          await _repo.updateStudentProfile(passwordController.text, avatar);
      result.when(
        success: (data) {
          emit(UpdateProfileState.updateProfileSuccess(data));
        },
        failure: (error) {
          emit(UpdateProfileState.updateProfileFailure(error.getAllMessages()));
        },
      );
    } else {
      final result =
          await _repo.updateTeacherProfile(passwordController.text, avatar);
      result.when(
        success: (data) {
          emit(UpdateProfileState.updateProfileSuccess(data));
        },
        failure: (error) {
          emit(UpdateProfileState.updateProfileFailure(error.getAllMessages()));
        },
      );
    }
  }

  void clearPassword() {
    passwordController.clear();
  }

  void setAvatar(String? avatarPath) {
    avatarPath = avatarPath;
    avatar = File(avatarPath!);
    emit(const UpdateProfileState.initial());
  }
}
