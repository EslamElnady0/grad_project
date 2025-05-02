import 'package:grad_project/core/networking/api_constants.dart';
import 'package:grad_project/core/networking/api_error_handler.dart';
import 'package:grad_project/core/networking/api_result.dart';
import 'package:grad_project/features/weekly_schedule/data/models/get_table_response_model.dart';

import '../data sources/get_tabel_local_data_source.dart';
import '../data sources/get_tabel_remote_data_source.dart';

class GetTabelRepo {
  final GetTabelRemoteDataSource remoteDataSource;
  final GetTabelLocalDataSource localDataSource;

  GetTabelRepo({
    required this.remoteDataSource,
    required this.localDataSource,
  });
  Future<ApiResult<GetTableResponseModel>> getTable() async {
    try {
      final response = await remoteDataSource.getTable(ApiConstants.table);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
