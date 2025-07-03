import 'package:grad_project/core/networking/api_error_handler.dart';
import 'package:grad_project/core/networking/api_result.dart';
import 'package:grad_project/features/forum/data/models/add_answer_request_model.dart';
import 'package:grad_project/features/forum/data/models/add_answer_response_model.dart';
import 'package:grad_project/features/forum/data/models/add_question_request_model.dart';
import 'package:grad_project/features/forum/data/models/add_question_response_model.dart';
import 'package:grad_project/features/forum/data/models/get_all_questions_response_model.dart';
import 'package:grad_project/features/forum/data/models/question_and_answers_response_model.dart';
import 'package:grad_project/features/forum/data/models/toggle_like_response_model.dart';
import 'package:grad_project/features/annoucements/data/models/add_annoucement_response_body.dart';

import '../data sources/questions_local_data_source.dart';
import '../data sources/questions_remote_data_source.dart';

class QuestionsRepo {
  final QuestionsRemoteDataSource remoteDataSource;
  final QuestionsLocalDataSource localDataSource;

  QuestionsRepo({
    required this.remoteDataSource,
    required this.localDataSource,
  });
  Future<ApiResult<GetAllQuestionsResponseModel>> getAllQuestions({int? page}) async {
    try {
      final response = await remoteDataSource.getFilteredQuestions(
        page,
        null,
        null,
        null,
        null,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<GetAllQuestionsResponseModel>> getFilteredQuestions({
    int? page,
    int? department,
    int? semester,
    bool? likes,
    bool? myQuestions,
  }) async {
    try {
      final response = await remoteDataSource.getFilteredQuestions(
        page,
        department,
        semester,
        likes,
        myQuestions,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<ToggleLikeResponseModel>> toggleLike(
      {required String questionId, required String like}) async {
    try {
      final response = await remoteDataSource.toggleLike(
        like,
        questionId,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<QuestionAndAnswersResponseModel>> getQuestionAndAnswers(
      String questionId) async {
    try {
      final response = await remoteDataSource.getQuestionAndAnswers(questionId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<AddAnswerResponseModel>> addAnswer({
    required String questionId,
    required String body,
    String? image,
  }) async {
    try {
      final request = AddAnswerRequestModel(body: body, image: image);
      final response = await remoteDataSource.addAnswer(questionId, request);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<AddQuestionResponseModel>> addQuestion({
    required String body,
    String? image,
  }) async {
    try {
      final request = AddQuestionRequestModel(body: body, image: image ?? '');
      final response = await remoteDataSource.addQuestion(request);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<SimpleResponseBody>> deleteQuestion({
    required String questionId,
    required String ownerId,
  }) async {
    try {
      final response = await remoteDataSource.deleteQuestion(questionId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<SimpleResponseBody>> deleteAnswer({
    required String answerId,
    required String ownerId,
  }) async {
    try {
      final response = await remoteDataSource.deleteAnswer(answerId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
