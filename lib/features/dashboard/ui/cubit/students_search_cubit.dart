import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/dashboard/data/models/students_response.dart';

class StudentsSearchCubit extends Cubit<String> {
  StudentsSearchCubit() : super('');

  void searchStudents(String query) {
    emit(query.trim());
  }

  void clearSearch() {
    emit('');
  }

  List<Student> filterStudents(List<Student> students, String searchQuery) {
    if (searchQuery.isEmpty) {
      return students;
    }

    return students.where((student) {
      return student.name.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();
  }
}
