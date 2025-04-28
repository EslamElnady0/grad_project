import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/add_annoucement_request_body.dart';
import '../../data/models/paginated_announcements_response.dart';
import '../../data/models/teachers_courses_response.dart';
import '../../data/repos/annoucements_repo.dart';
part 'update_annoucement_state.dart';
part 'update_annoucement_cubit.freezed.dart';

class UpdateAnnoucementCubit extends Cubit<UpdateAnnoucementState> {
  final AnnoucementsRepo _repo;
  UpdateAnnoucementCubit(this._repo)
      : super(const UpdateAnnoucementState.initial());
  List<CourseResponse> coursesList = [];
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  CourseResponse? selectedCourse;
  bool editedOldDateAndTime = false;
  String? selectedDate;
  String? selectedTime;
  Future<void> updateAnnoucement(Announcement annoucement) async {
    emit(const UpdateAnnoucementState.updateAnnoucementLoading());
    final result = await _repo.updateAnnoucement(
        announcementRequestBody: AnnouncementRequestBody(
          departmentId: annoucement.department.id.toString(),
          semesterId: annoucement.semester.id.toString(),
          courseId: selectedCourse?.id.toString() ?? "",
          title: titleController.text,
          body: descController.text,
          date: selectedDate,
          time: selectedTime,
        ),
        id: annoucement.id.toString());
    result.when(
      success: (data) {
        emit(UpdateAnnoucementState.updateAnnoucementSuccess(data));
      },
      failure: (error) {
        emit(UpdateAnnoucementState.updateAnnoucementFailure(
            error.getAllMessages()));
      },
    );
  }

  String selectedCourseText = '';
  void selectCourse(CourseResponse course) {
    selectedCourseText = "${course.name}    ${course.semester.name}";
    selectedCourse = course;
    log("selected course: $selectedCourseText");
    emit(UpdateAnnoucementState.selected(
      selectedCourse: course,
      selectedCourseText: selectedCourseText,
    ));
  }

  @override
  Future<void> close() {
    titleController.dispose();
    descController.dispose();
    return super.close();
  }
}
