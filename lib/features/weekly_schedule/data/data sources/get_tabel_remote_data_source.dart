import 'package:dio/dio.dart';
import 'package:grad_project/features/weekly_schedule/data/models/get_table_response_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
part 'get_tabel_remote_data_source.g.dart';

//if this file is created for the first time or modified
//run the command:
//?=> dart run build_runner build --delete-conflicting-outputs
//to generate the .g.dart file
@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class GetTabelRemoteDataSource {
  factory GetTabelRemoteDataSource(Dio dio,
      {String baseUrl, ParseErrorLogger? errorLogger}) = _GetTabelRemoteDataSource;

  @GET("/teachers/table")
  Future<GetTableResponseModel> getTable();
}
