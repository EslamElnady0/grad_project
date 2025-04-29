import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grad_project/core/data/models/students_courses_response.dart';
import 'package:grad_project/core/data/models/teachers_courses_response.dart';
part 'all_courses.freezed.dart';

@freezed
class AllCourses with _$AllCourses {
  const factory AllCourses.teacher(TeachersCoursesResponse courses) = _Teacher;
  const factory AllCourses.student(StudentsCoursesResponse courses) = _Student;
}
