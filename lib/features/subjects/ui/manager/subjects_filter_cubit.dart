import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectsFilterCubit extends Cubit<int> {
  SubjectsFilterCubit() : super(1); 

  void toggleSemester(int semester) {
    emit(semester);
  }
}
