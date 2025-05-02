import 'package:dio/dio.dart';
import 'package:grad_project/features/quizes/data/models/create_quiz_request_model.dart';
import 'package:grad_project/features/quizes/data/models/create_quiz_response_model.dart';
import 'package:grad_project/features/quizes/data/models/get_quizzes_response.dart';
import 'package:grad_project/features/time_schedule/data/models/activity_response_model.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/networking/api_constants.dart';
part 'quizzes_remote_data_source.g.dart';

//if this file is created for the first time or modified
//run the command:
//?=> dart run build_runner build --delete-conflicting-outputs
//to generate the .g.dart file
@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class QuizzesRemoteDataSource {
  factory QuizzesRemoteDataSource(Dio dio,
      {String baseUrl,
      ParseErrorLogger? errorLogger}) = _QuizzesRemoteDataSource;

  @POST('${ApiConstants.teachers}${ApiConstants.quizzes}')
  Future<CreateQuizResponseModel> createQuiz(
      @Body() CreateQuizRequestModel createQuizRequestModel);

  @GET('${ApiConstants.teachers}${ApiConstants.quizzes}')
  Future<GetQuizzesResponse> getQuizzes(
    @Query("course") String courseId,
    @Query("status") String quizStatus,
    @Query("from") String fromDate,
  );

  @GET(ApiConstants.quizzes)
  Future<StudentQuizResponseModel> getStudentQuizzes();
}
