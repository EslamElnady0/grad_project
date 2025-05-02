import 'dart:io';
import 'package:dio/dio.dart';
import 'package:grad_project/core/networking/api_constants.dart';
import 'package:grad_project/features/assignments/data/models/create_assignment_response_model.dart';
import 'package:grad_project/features/assignments/data/models/get_assignments_response_model.dart';
import 'package:grad_project/features/time_schedule/data/models/activity_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'assignments_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class AssignmentsRemoteDataSource {
  factory AssignmentsRemoteDataSource(Dio dio,
      {String baseUrl,
      ParseErrorLogger? errorLogger}) = _AssignmentsRemoteDataSource;

  @POST("${ApiConstants.teachers}${ApiConstants.assignments}")
  @MultiPart()
  Future<CreateAssignmentResponseModel> createAssignment(
    @Part(name: 'course_id') int courseId,
    @Part(name: 'title') String title,
    @Part(name: 'description') String description,
    @Part(name: 'total_degree') String totalDegree,
    @Part(name: 'date') String date,
    @Part(name: 'time') String time,
    @Part(name: 'file') File file,
  );


  @GET("${ApiConstants.teachers}${ApiConstants.assignments}")
  Future<GetAssignmentsResponseModel> getAssignments(
    @Query("course") String courseId,
    @Query("status") String assignmentStatus,
    @Query("from") String fromDate,
  );

  @GET(ApiConstants.assignments)
  Future<StudentAssignmentResponseModel> getStudentAssignments(
  );
}
