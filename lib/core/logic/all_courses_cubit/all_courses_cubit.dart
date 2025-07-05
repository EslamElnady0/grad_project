import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/data/models/students_courses_response.dart';
import 'package:grad_project/core/data/models/teachers_courses_response.dart';
import '../../data/repos/all_courses_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'all_courses_state.dart';
part 'all_courses_cubit.freezed.dart';

class AllCoursesCubit extends Cubit<AllCoursesState> {
  final AllCoursesRepo _repo;
  AllCoursesCubit(this._repo) : super(const AllCoursesState.initial());

  Future<void> get() async {
    emit(const AllCoursesState.allCoursesLoading());
    final result = await _repo.getAllCourses();
    result.when(
      success: (data) {
        data.when(
          teacher: (data) {
            if (data.data.isEmpty) {
              emit(AllCoursesState.allCoursesFailure('No courses available'));
            } else {
              emit(AllCoursesState.allTeacherCoursesSuccess(data));
            }
          },
          student: (data) {
            if (data.data.isEmpty) {
              emit(AllCoursesState.allCoursesFailure('No courses available'));
            } else {
              emit(AllCoursesState.allStudentCoursesSuccess(data));
            }
          },
        );
      },
      failure: (error) {
        emit(AllCoursesState.allCoursesFailure(error.getAllMessages()));
      },
    );
  }
}
