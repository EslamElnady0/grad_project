import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/flavors/flavors_functions.dart';
import 'package:grad_project/features/profile/data/repos/profile_repo.dart';
import 'package:grad_project/features/profile/logic/get_profile_cubit/get_profile_state.dart';

class GetProfileCubit extends Cubit<GetProfileState> {
  final ProfileRepo _repo;
  GetProfileCubit(this._repo) : super(const GetProfileState.initial());

  Future<void> getProfile() async {
    emit(const GetProfileState.getProfileLoading());
    print("loading");
    if (FlavorsFunctions.isAdmin()) {
      final result = await _repo.getTeacherProfile();
      result.when(
        success: (data) => emit(GetProfileState.getProfileSuccess(data)),
        failure: (error) =>
            emit(GetProfileState.getProfileFailure(error.getAllMessages())),
      );
    } else {
      final result = await _repo.getStudentProfile();
      result.when(
        success: (data) => emit(GetProfileState.getProfileSuccess(data)),
        failure: (error) =>
            emit(GetProfileState.getProfileFailure(error.getAllMessages())),
      );
    }
  }
}
