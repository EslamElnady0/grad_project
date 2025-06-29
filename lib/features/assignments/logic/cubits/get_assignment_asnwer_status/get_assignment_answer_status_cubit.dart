import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/assignments/data/repos/assignments_repo.dart';
import 'package:grad_project/features/assignments/logic/cubits/get_assignment_asnwer_status/get_assignment_answer_status_state.dart';

class GetAssignmentAnswerStatusCubit
    extends Cubit<GetAssignmentAnswerStatusState> {
  final AssignmentsRepo _repo;
  GetAssignmentAnswerStatusCubit(this._repo)
      : super(const GetAssignmentAnswerStatusState.initial());

  Future<void> getAssignmentDetails(int assignmentId) async {
    emit(const GetAssignmentAnswerStatusState.loading());
    final result = await _repo.getAssignmentDetails(assignmentId);
    result.when(
      success: (data) => emit(
          GetAssignmentAnswerStatusState.success(data)),
      failure: (error) => emit(
          GetAssignmentAnswerStatusState.failure(
              error.getAllMessages())),
    );
  }
}
