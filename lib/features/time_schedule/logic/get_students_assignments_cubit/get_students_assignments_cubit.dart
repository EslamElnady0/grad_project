

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/assignments/data/repos/assignments_repo.dart';
import 'package:grad_project/features/time_schedule/logic/get_students_assignments_cubit/get_students_assignments_state.dart';

class GetStudentsAssignmentsCubit extends Cubit<GetStudentsAssignmentsState> {

  final AssignmentsRepo assignmentsRepo;
  GetStudentsAssignmentsCubit(this.assignmentsRepo) : super(const GetStudentsAssignmentsState.initial());

  Future<void> getStudentsAssignments() async {
    emit(const GetStudentsAssignmentsState.getStudentsAssignmentsLoading());
    final result = await assignmentsRepo.getStudentAssignments();

    result.when(
      success: (data) {
        emit(GetStudentsAssignmentsState.getStudentsAssignmentsSuccess(data));
      },
      failure: (error) {
        emit(GetStudentsAssignmentsState.getStudentsAssignmentsFailure(error.getAllMessages()));
      },
    );
  }
}
