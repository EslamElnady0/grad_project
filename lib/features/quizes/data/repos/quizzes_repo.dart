import 'package:grad_project/core/networking/api_error_handler.dart';
import 'package:grad_project/core/networking/api_result.dart';
import 'package:grad_project/features/quizes/data/models/create_quiz_request_model.dart';
import 'package:grad_project/features/quizes/data/models/create_quiz_response_model.dart';

import '../data sources/quizzes_local_data_source.dart';
import '../data sources/quizzes_remote_data_source.dart';

class QuizzesRepo {
  final QuizzesRemoteDataSource remoteDataSource;
  final QuizzesLocalDataSource localDataSource;

  QuizzesRepo({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  Future<ApiResult<CreateQuizResponseModel>> createQuiz(
      CreateQuizRequestModel createQuizRequestModel) async {
    try {
      final result = await remoteDataSource.createQuiz(createQuizRequestModel);
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
