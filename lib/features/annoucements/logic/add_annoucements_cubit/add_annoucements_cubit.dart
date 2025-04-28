import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grad_project/features/annoucements/data/models/teachers_courses_response.dart';
import 'package:grad_project/features/annoucements/logic/get_teacher_cources_cubit/get_teacher_cources_cubit.dart';

import '../../data/models/add_annoucement_request_body.dart';
import '../../data/repos/annoucements_repo.dart';
part 'add_annoucements_state.dart';
part 'add_annoucements_cubit.freezed.dart';

class AddAnnoucementsCubit extends Cubit<AddAnnoucementsState> {
  final AnnoucementsRepo _repo;
  final GetCourcesToFilterCubit _getTeacherCourcesCubit;
  AddAnnoucementsCubit(this._repo, this._getTeacherCourcesCubit)
      : super(const AddAnnoucementsState.initial());
  late List<CourseResponse> coursesList;
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  CourseResponse? selectedCourse;
  String? selectedDate;
  String? selectedTime;
  Future<void> addAnnoucement() async {
    emit(const AddAnnoucementsState.addAnnoucementsLoading());
    final result = await _repo.addAnnoucement(
      AnnouncementRequestBody(
        departmentId: selectedCourse?.department.id.toString() ?? '',
        semesterId: selectedCourse?.semester.id.toString() ?? '',
        courseId: selectedCourse?.id.toString() ?? '',
        title: titleController.text,
        body: descController.text,
        date: selectedDate,
        time: selectedTime,
      ),
    );
    result.when(
      success: (data) {
        emit(AddAnnoucementsState.addAnnoucementsSuccess(data));
      },
      failure: (error) {
        emit(AddAnnoucementsState.addAnnoucementsFailure(
            error.getAllMessages()));
      },
    );
  }

  Future<List<CourseResponse>> getTeacherCourses() async {
    await _getTeacherCourcesCubit.getTeacherCourses();
    coursesList = _getTeacherCourcesCubit.coursesResponse?.data ?? [];
    return coursesList;
  }

  String selectedCourseText = '';
  void selectCourse(CourseResponse course) {
    selectedCourseText = "${course.name}    ${course.semester.name}";
    selectedCourse = course;
    log("selected course: $selectedCourseText");
    emit(const AddAnnoucementsState.selected());
  }

  @override
  Future<void> close() {
    titleController.dispose();
    descController.dispose();
    return super.close();
  }
}
