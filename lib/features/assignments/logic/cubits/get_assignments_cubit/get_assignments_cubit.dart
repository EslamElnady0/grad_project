import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/assignments/data/models/get_assignments_request_query_params_model.dart';
import 'package:grad_project/features/assignments/data/repos/assignments_repo.dart';
import 'package:grad_project/features/assignments/logic/cubits/get_assignments_cubit/get_assignments_state.dart';

class GetAssignmentsCubit extends Cubit<GetAssignmentsState> {
  final AssignmentsRepo _repo;
  GetAssignmentsCubit(this._repo) : super(const GetAssignmentsState.initial());

  Future<void> getAssignments({
    required String courseId,
    required String assignmentStatus,
    required String fromDate,
  }) async {
    emit(const GetAssignmentsState.getAssignmentsLoading());
    final result = await _repo.getAssignments(
      GetAssignmentsRequestQueryParamsModel(
        courseId: courseId,
        assignmentStatus: assignmentStatus,
        fromDate: fromDate,
      ),
    );
    result.when(
      success: (data) => emit(GetAssignmentsState.getAssignmentsSuccess(data)),
      failure: (error) => emit(GetAssignmentsState.getAssignmentsFailure(error.getAllMessages())),
    );
  }
}
