import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/assignments/data/models/upload_assignment_solution_model.dart';
import 'package:grad_project/features/assignments/data/repos/assignments_repo.dart';
import 'package:grad_project/features/time_schedule/logic/upload_assignment_solution_cubit/upload_assignment_solution_state.dart';

class UploadAssignmentSolutionCubit
    extends Cubit<UploadAssignmentSolutionState> {
  final AssignmentsRepo _repo;
  UploadAssignmentSolutionCubit(this._repo)
      : super(const UploadAssignmentSolutionState.initial());

   File? uploadedSolution;
  Future<void> uploadAssignmentSolution({
    required int assignmentId,
    required File file,
  }) async {
    emit(const UploadAssignmentSolutionState.uploadAssignmentSolutionLoading());

    if (file.path.isEmpty) {
      emit(const UploadAssignmentSolutionState.uploadAssignmentSolutionFailure(
          'Please select a file'));
      return;
    }
    final result = await _repo.uploadAssignmentSolution(
        UploadAssignmentSolutionModel(id: assignmentId, file: file));
    result.when(
      success: (data) {
        emit(UploadAssignmentSolutionState.uploadAssignmentSolutionSuccess(
            data));
      },
      failure: (error) {
        emit(UploadAssignmentSolutionState.uploadAssignmentSolutionFailure(
            error.getAllMessages()));
      },
    );
  }

  void setUploadedAssignmentSolution(PlatformFile platformFile) {
    uploadedSolution = File(platformFile.path!);
  }
}
