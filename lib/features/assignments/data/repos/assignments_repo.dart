import 'dart:io';
import 'package:grad_project/core/networking/api_error_handler.dart';
import 'package:grad_project/core/networking/api_result.dart';
import 'package:grad_project/features/assignments/data/data_sources/assignments_local_data_source.dart';
import 'package:grad_project/features/assignments/data/data_sources/assignments_remote_data_source.dart';
import 'package:grad_project/features/assignments/data/models/create_assignment_request_model.dart';
import 'package:grad_project/features/assignments/data/models/create_assignment_response_model.dart';

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
}