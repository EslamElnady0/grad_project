import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/assignments/data/repos/assignments_repo.dart';
import 'package:grad_project/features/assignments/logic/cubits/get_assignments_answers_cubit/get_assignments_answers_state.dart';

class GetAssignmentsAnswersCubit extends Cubit<GetAssignmentsAnswersState> {
  final AssignmentsRepo _repo;
  GetAssignmentsAnswersCubit(this._repo)
      : super(const GetAssignmentsAnswersState.initial());

  Future<void> getAssignmentsAnswers(int assignmentId) async {
    emit(const GetAssignmentsAnswersState.getAssignmentsAnswersLoading());
    final result = await _repo.getAssignmentsAnswers(assignmentId);
    result.when(
      success: (data) =>
          emit(GetAssignmentsAnswersState.getAssignmentsAnswersSuccess(data)),
      failure: (error) => emit(
          GetAssignmentsAnswersState.getAssignmentsAnswersFailure(
              error.getAllMessages())),
    );
  }
}
