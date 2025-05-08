import 'package:dio/dio.dart';
import 'package:grad_project/core/networking/api_constants.dart';
import 'package:grad_project/features/forum/data/models/get_all_questions_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'get_all_questions_remote_data_source.g.dart';

//if this file is created for the first time or modified
//run the command:
//?=> dart run build_runner build --delete-conflicting-outputs
//to generate the .g.dart file
@RestApi(baseUrl: ApiConstants.apiBaseUrlSecond)
abstract class GetAllQuestionsRemoteDataSource {
  factory GetAllQuestionsRemoteDataSource(Dio dio,
      {String baseUrl, ParseErrorLogger? errorLogger}) = _GetAllQuestionsRemoteDataSource;
  @GET(ApiConstants.questions)
  Future<GetAllQuestionsResponseModel> getAllQuestions();
}
