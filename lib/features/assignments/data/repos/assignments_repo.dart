import 'dart:io';
import 'package:grad_project/core/networking/api_error_handler.dart';
import 'package:grad_project/core/networking/api_result.dart';
import 'package:grad_project/features/assignments/data/data_sources/assignments_local_data_source.dart';
import 'package:grad_project/features/assignments/data/data_sources/assignments_remote_data_source.dart';
import 'package:grad_project/features/assignments/data/models/assignments_solution_response_model.dart';
import 'package:grad_project/features/assignments/data/models/create_assignment_request_model.dart';
import 'package:grad_project/features/assignments/data/models/create_assignment_response_model.dart';
import 'package:grad_project/features/assignments/data/models/edit_assignment_request_model.dart';
import 'package:grad_project/features/assignments/data/models/edit_assignment_response_model.dart';
import 'package:grad_project/features/assignments/data/models/get_assignments_request_query_params_model.dart';
import 'package:grad_project/features/assignments/data/models/get_assignments_response_model.dart';
import 'package:grad_project/features/time_schedule/data/models/activity_response_model.dart';

class AssignmentsRepo {
  final AssignmentsRemoteDataSource remoteDataSource;
  final AssignmentsLocalDataSource localDataSource;
  AssignmentsRepo({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  Future<ApiResult<CreateAssignmentResponseModel>> createAssignment(
      CreateAssignmentRequestModel assignmentRequestModel) async {
    try {
      final response = await remoteDataSource.createAssignment(
        assignmentRequestModel.courseId,
        assignmentRequestModel.title,
        assignmentRequestModel.description,
        assignmentRequestModel.totalDegree,
        assignmentRequestModel.date,
        assignmentRequestModel.time,
        File(assignmentRequestModel.file.path),
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<GetAssignmentsResponseModel>> getAssignments(
      GetAssignmentsRequestQueryParamsModel
          getAssignmentRequestQueryParamsModel) async {
    try {
      final response = await remoteDataSource.getAssignments(
        getAssignmentRequestQueryParamsModel.courseId,
        getAssignmentRequestQueryParamsModel.assignmentStatus,
        getAssignmentRequestQueryParamsModel.fromDate,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<List<StudentAssignmentModel>>>
      getStudentAssignments() async {
    try {
      final response = await remoteDataSource.getStudentAssignments();
      return ApiResult.success(response.data);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<AssignmentsSolutionResponseModel>> uploadAssignmentSolution(
      UploadAssignmentSolutionModel) async {
    try {
      final response = await remoteDataSource.uploadAssignmentSolution(
        UploadAssignmentSolutionModel.id,
        File(UploadAssignmentSolutionModel.file.path),
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<EditAssignmentResponseModel>> editAssignment(
      EditAssignmentRequestModel editAssignmentRequestModel) async {
    try {
      final response = await remoteDataSource.editAssignment(
        editAssignmentRequestModel.assignmentId,
        editAssignmentRequestModel.courseId,
        editAssignmentRequestModel.title,
        editAssignmentRequestModel.description,
        editAssignmentRequestModel.totalDegree,
        editAssignmentRequestModel.date,
        editAssignmentRequestModel.time,
        editAssignmentRequestModel.file != null
            ? File(editAssignmentRequestModel.file!.path)
            : null,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
