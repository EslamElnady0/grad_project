import 'package:grad_project/core/networking/api_error_handler.dart';
import 'package:grad_project/core/networking/api_result.dart';
import 'package:grad_project/features/quizes/data/models/create_quiz_request_model.dart';
import 'package:grad_project/features/quizes/data/models/create_quiz_response_model.dart';
import 'package:grad_project/features/quizes/data/models/get_quizzes_response.dart';

import '../../../annoucements/data/models/add_annoucement_response_body.dart';
import '../data sources/quizzes_local_data_source.dart';
import '../data sources/quizzes_remote_data_source.dart';
import '../models/get_quizzes_request_query_params_model.dart';

class QuizzesRepo {
  final QuizzesRemoteDataSource remoteDataSource;
  final QuizzesLocalDataSource localDataSource;

  QuizzesRepo({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  Future<ApiResult<QuizResponseModel>> createQuiz(
      QuizRequestModel createQuizRequestModel) async {
    try {
      final result = await remoteDataSource.createQuiz(createQuizRequestModel);
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<GetQuizzesResponse>> getQuizzes(
      GetQuizzesRequestQueryParamsModel getQuizzesRequestQueryParams) async {
    try {
      final result = await remoteDataSource.getQuizzes(
        getQuizzesRequestQueryParams.courseId,
        getQuizzesRequestQueryParams.quizStatus,
        getQuizzesRequestQueryParams.fromDate,
      );
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<SimpleResponseBody>> deleteQuiz(
    String quizId,
  ) async {
    try {
      final result = await remoteDataSource.deleteQuiz(quizId);
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<SimpleResponseBody>> updateQuiz(
    String quizId,
    QuizRequestModel quizRequestModel,
  ) async {
    try {
      final result =
          await remoteDataSource.updateQuiz(quizId, quizRequestModel);
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
