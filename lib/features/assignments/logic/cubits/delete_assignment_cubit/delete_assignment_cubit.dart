import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/assignments/data/repos/assignments_repo.dart';
import 'package:grad_project/features/assignments/logic/cubits/delete_assignment_cubit/delete_assignment_state.dart';

class DeleteAssignmentCubit extends Cubit<DeleteAssignmentState> {
  final AssignmentsRepo _assignmentsRepo;

  DeleteAssignmentCubit(this._assignmentsRepo)
      : super(const DeleteAssignmentState.initial());

  Future<void> deleteAssignment(int assignmentId) async {
    emit(const DeleteAssignmentState.loading());
    final result = await _assignmentsRepo.deleteAssignment(assignmentId);
    result.when(
      success: (data) {
        emit(DeleteAssignmentState.success(data));
      },
      failure: (error) {
        emit(DeleteAssignmentState.failure(error.getAllMessages()));
      },
    );
  }
}
