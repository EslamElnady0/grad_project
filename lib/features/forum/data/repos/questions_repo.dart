import 'package:grad_project/core/networking/api_error_handler.dart';
import 'package:grad_project/core/networking/api_result.dart';
import 'package:grad_project/features/forum/data/models/get_all_questions_response_model.dart';
import 'package:grad_project/features/forum/data/models/toggle_like_response_model.dart';

import '../data sources/questions_local_data_source.dart';
import '../data sources/questions_remote_data_source.dart';

class QuestionsRepo {
  final QuestionsRemoteDataSource remoteDataSource;
  final QuestionsLocalDataSource localDataSource;

  QuestionsRepo({
    required this.remoteDataSource,
    required this.localDataSource,
  });
 Future<ApiResult<GetAllQuestionsResponseModel>> getAllQuestions() async {
    try {
      final response = await remoteDataSource.getAllQuestions();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }


  Future<ApiResult<ToggleLikeResponseModel>> toggleLike(String questionId) async {
    try {
      final response = await remoteDataSource.toggleLike(questionId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
