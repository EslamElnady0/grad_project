import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/assignments/data/repos/assignments_repo.dart';
import 'package:grad_project/features/assignments/logic/cubits/assign_grade_cubit/assign_grade_state.dart';

class AssignGradeCubit extends Cubit<AssignGradeState> {
  final AssignmentsRepo _assignmentsRepo;
  AssignGradeCubit(this._assignmentsRepo)
      : super(const AssignGradeState.initial());

  Future<void> assignGrade(int answerId, int degree) async {
    emit(const AssignGradeState.loading());
    final result = await _assignmentsRepo.gradeAssignment(answerId, degree);
    result.when(
      success: (data) => emit(AssignGradeState.success(
        answerId: answerId,
        newDegree: degree,
        data: data,
      )),
      failure: (error) =>
          emit(AssignGradeState.failure(error.getAllMessages())),
    );
  }
}
