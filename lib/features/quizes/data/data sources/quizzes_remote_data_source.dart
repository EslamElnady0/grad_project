import 'package:dio/dio.dart';
import 'package:grad_project/features/annoucements/data/models/add_annoucement_response_body.dart';
import 'package:grad_project/features/quizes/data/models/create_quiz_request_model.dart';
import 'package:grad_project/features/quizes/data/models/create_quiz_response_model.dart';
import 'package:grad_project/features/quizes/data/models/get_quizzes_response.dart';
import 'package:grad_project/features/quizes/data/models/submit_quiz_request_body.dart';
import 'package:grad_project/features/time_schedule/data/models/activity_response_model.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/networking/api_constants.dart';
import '../models/get_quiz_using_id_response.dart';
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
  Future<QuizResponseModel> createQuiz(
      @Body() QuizRequestModel quizRequestModel);

  @GET('${ApiConstants.teachers}${ApiConstants.quizzes}')
  Future<GetQuizzesResponse> getQuizzes(
    @Query("course") String courseId,
    @Query("status") String quizStatus,
    @Query("from") String fromDate,
  );
  @DELETE('${ApiConstants.teachers}${ApiConstants.quizzes}/{quizId}')
  Future<SimpleResponseBody> deleteQuiz(
    @Path("quizId") String quizId,
  );
  @PUT('${ApiConstants.teachers}${ApiConstants.quizzes}/{quizId}')
  Future<QuizResponseModel> updateQuiz(
    @Path("quizId") String quizId,
    @Body() QuizRequestModel quizRequestModel,
  );
  @GET('${ApiConstants.teachers}${ApiConstants.quizzes}/{quizId}')
  Future<GetQuizByIdResponse> getQuizById(
    @Path("quizId") String quizId,
  );

  @GET(ApiConstants.quizzes)
  Future<StudentQuizResponseModel> getStudentQuizzes();

  @GET("${ApiConstants.quizzes}/{quizId}/start")
  Future<GetQuizByIdResponse> startStudentsQuiz(
    @Path("quizId") String quizId,
  );
  @POST("${ApiConstants.quizzes}/{quizId}/submit")
  Future<dynamic> submitQuiz(
    @Path("quizId") String quizId,
    @Body() SubmitQuizRequestBody submitQuizRequestModel,
  );
}
