import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/annoucements/data/repos/annoucements_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/teachers_courses_response.dart';
part 'get_teacher_cources_state.dart';
part 'get_teacher_cources_cubit.freezed.dart';

class GetCourcesToFilterCubit extends Cubit<GetCourcesToFilterState> {
  final AnnoucementsRepo _repo;
  GetCourcesToFilterCubit(this._repo)
      : super(const GetCourcesToFilterState.initial());
  TeachersCoursesResponse? coursesResponse;
  Future<void> getTeacherCourses() async {
    emit(const GetCourcesToFilterState.getCourcesToFilterLoading());
    final result = await _repo.getTeacherCourses();
    result.when(
      success: (data) {
        coursesResponse = data;
        emit(GetCourcesToFilterState.getCourcesToFilterSuccess(data));
      },
      failure: (error) {
        emit(GetCourcesToFilterState.getCourcesToFilterFailure(
            error.getAllMessages()));
      },
    );
  }

  Future<void> getStudentsCourses() async {
    emit(const GetCourcesToFilterState.getCourcesToFilterLoading());
    final result = await _repo.getStudentsCourses();
    result.when(
      success: (data) {
        emit(GetCourcesToFilterState.getCourcesToFilterSuccess(data));
      },
      failure: (error) {
        emit(GetCourcesToFilterState.getCourcesToFilterFailure(
            error.getAllMessages()));
      },
    );
  }
}
